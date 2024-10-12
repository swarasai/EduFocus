//
//  HomeView.swift
//  Edu_Focus
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Add the logo image here
                Image("AppLogo")  // Make sure "AppLogo" is in your asset catalog
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)  // Adjust the size of the logo as needed
                    .padding(.bottom, 20)  // Optional: add some space between the logo and the buttons
                
                NavigationLink(destination: ContentView()) {
                    Text("Find Extracurriculars")
                        .font(.custom("Copperplate", size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: NotesHelpView()) {  // Link to the new NotesHelpView with photo capture
                    Text("Notes To Text")
                        .font(.custom("Copperplate", size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
