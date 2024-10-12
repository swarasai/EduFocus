//
//  ContentView.swift
//  Edu_Focus
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""

    private let buttonFont = Font.custom("Copperplate", size: 24)
    private let buttonColor = Color.black

    var filteredCategories: [String] {
        return categories.filter { searchText.isEmpty || $0.lowercased().contains(searchText.lowercased()) }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {  // Set spacing to 0 to remove the extra space between elements
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                    .padding(.top, 10)  // Add a slight top padding if needed

                

                ScrollView(.vertical) {
                    VStack(spacing: 20) {
                        SectionHeader(title: "Categories:")
                            .padding(.top, 0)  // Remove top padding from SectionHeader

                        ForEach(filteredCategories, id: \.self) { category in
                            NavigationLink(
                                destination: destinationViewForCategory(category),
                                label: {
                                    NavigationLinkButton(destination: destinationViewForCategory(category), title: category, font: buttonFont, color: buttonColor, icon: iconForCategory(category))
                                }
                            )
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }

    let categories = ["Engineering", "Medicine", "Business", "Law", "Psychology"]

    func destinationViewForCategory(_ category: String) -> some View {
        switch category {
        case "Medicine":
            return AnyView(Medicine())
        case "Engineering":
            return AnyView(Engineering())
        case "Business":
            return AnyView(Business())
        case "Law":
            return AnyView(Law())
        case "Psychology":
            return AnyView(Psychology())
        default:
            return AnyView(EmptyView())
        }
    }

    func iconForCategory(_ category: String) -> String {
        switch category {
        case "Medicine":
            return "heart"
        case "Engineering":
            return "wrench"
        case "Business":
            return "briefcase"
        case "Law":
            return "shield"
        case "Psychology":
            return "brain"
        default:
            return ""
        }
    }
}

// Helper Views used in the ContentView
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        TextField("Search", text: $text)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}

struct SectionHeader: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.black)
            .padding(.top)  // You can remove or reduce this padding to close the gap
    }
}

struct NavigationLinkButton<Destination: View>: View {
    var destination: Destination
    var title: String
    var font: Font
    var color: Color
    var icon: String
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(Font.system(size: 24))
                
                Text(title)
                    .font(font)
                    .foregroundColor(color)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

