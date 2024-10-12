//
//  NotesHelpView.swift
//  Edu_Focus
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI
import Vision

struct NotesHelpView: View {
    @State private var capturedImage: UIImage?  // State to store captured image
    @State private var showImagePicker = false  // State to show the image picker
    @State private var extractedText: String = ""  // State to store extracted text
    @State private var isRetakingPhoto = false // State to control photo retake

    var body: some View {
        VStack(spacing: 20) {
            if let image = capturedImage, !isRetakingPhoto {
                // Display the captured image and extracted text
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text("Extracted Text:")
                    .font(.headline)
                    .padding(.top)
                
                ScrollView {
                    Text(extractedText)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                
                // Button to retake photo
                Button(action: {
                    isRetakingPhoto = true
                    showImagePicker = true
                }) {
                    Text("Retake Photo")
                        .font(.custom("Copperplate", size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            } else {
                // Button to take a photo
                Button(action: {
                    showImagePicker = true
                }) {
                    Text("Take a Photo")
                        .font(.custom("Copperplate", size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            PhotoCaptureView(onImageCaptured: { image in
                capturedImage = image
                isRetakingPhoto = false
                if let img = image {
                    analyzeImage(image: img)
                }
            })
        }
    }

    // Function to analyze the image and extract text
    private func analyzeImage(image: UIImage) {
        extractText(from: image) { text in
            DispatchQueue.main.async {
                self.extractedText = text.isEmpty ? "No text found." : text
            }
        }
    }

    // Function to extract text from the image using Vision framework
    private func extractText(from image: UIImage, completion: @escaping (String) -> Void) {
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print("Error recognizing text: \(error)")
                completion("")
                return
            }

            let observations = request.results as? [VNRecognizedTextObservation]
            let recognizedStrings = observations?.compactMap { observation in
                observation.topCandidates(1).first?.string
            }

            let fullText = recognizedStrings?.joined(separator: "\n") ?? ""
            completion(fullText)
        }

        guard let cgImage = image.cgImage else {
            completion("")
            return
        }

        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                print("Failed to perform text recognition request: \(error)")
                completion("")
            }
        }
    }
}
