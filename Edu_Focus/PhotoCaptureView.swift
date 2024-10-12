//
//  PhotoCaptureView.swift
//  Edu_Focus
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI
import UIKit

struct PhotoCaptureView: UIViewControllerRepresentable {
    var onImageCaptured: (UIImage?) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        picker.allowsEditing = false
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: PhotoCaptureView

        init(_ parent: PhotoCaptureView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // Extract the image from the picker
            let image = info[.originalImage] as? UIImage
            // Pass the image back to the SwiftUI view
            parent.onImageCaptured(image)
            // Dismiss the picker
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // Handle cancellation
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
