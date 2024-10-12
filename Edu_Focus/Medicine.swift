//
//  Medicine.swift
//  Edu_Focus
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI

struct Opportunity: Identifiable {
    var id = UUID()
    var title: String
    var url: String
    var description: String
    var ageGroup: String
    var backgroundColor: Color
}

struct Medicine: View {
    @Environment(\.openURL) private var openURL
    
    @State private var selectedAgeGroup = "All"
    
    let opportunities = [
        Opportunity(
            title: "National Student Leadership Conference",
            url: "https://www.nslcleaders.org/?gclid=Cj0KCQjw98ujBhCgARIsAD7QeAis2t5piL8oTaUJwZoDhq8CQhigGXUdL0l1ujhaJjfG7eACsq6_HUoaAkwLEALw_wcB",
            description: "-for middle and high school students\n-live on a college campus, hands-on activities, and see the behind-the-scenes work of your dream career",
            ageGroup: "Middle School, High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "CSSEC Internship",
            url: "https://med.stanford.edu/cssec/summer-internship.html",
            description: "-need to be 16 years old or a junior in high school\n-understand principles of cardiac and thoracic diseases and surgery, get hands-on practice of fundamental surgical skills, and practice key cardiothoracic surgical techniques",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Memorial Sloan Cancer Center Internship",
            url: "https://www.mskcc.org/education-training/high-school-college",
            description: "-for high school students\n-students learn how to conduct independent research and participate in a number of extracurricular activities",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Horizon",
            url: "https://www.horizoninspires.com/",
            description: "-for high school students\n-students develop college level research project under the guidance of a professor",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Bay Area Youth Science Program",
            url: "https://pharm.ucsf.edu/bays",
            description: "--rising high school juniors and seniors\n-an eight-week, paid summer internship for rising high school juniors and seniors to conduct research in labs at UCSF.",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Stanford Medical Youth Science Program",
            url: "https://med.stanford.edu/odme/high-school-students/smysp.html",
            description: "-for high school juniors\n-a five-week immersive enrichment program focused on science and medicine that is open to low-income, first-generation high school juniors",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        )
    ]
    
    var filteredOpportunities: [Opportunity] {
        if selectedAgeGroup == "All" {
            return opportunities
        } else {
            return opportunities.filter { $0.ageGroup.contains(selectedAgeGroup) }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Picker("Select Age Group", selection: $selectedAgeGroup) {
                    Text("All").tag("All")
                    Text("Middle School").tag("Middle School")
                    Text("High School").tag("High School")
                    }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                Text("Opportunities:")
                    .font(.custom("AmericanTypewriter", size: 30))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                ForEach(filteredOpportunities) { opportunity in
                    OpportunityButton(
                        opportunity: opportunity
                    )
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct OpportunityButton: View {
    @Environment(\.openURL) private var openURL
    var opportunity: Opportunity
    
    var body: some View {
        VStack(spacing: 10) {
            Button {
                if let url = URL(string: opportunity.url) {
                    openURL(url)
                }
            } label: {
                Label(opportunity.title, systemImage: "link")
                    .font(.custom("AmericanTypewriter", size: 24))
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(opportunity.backgroundColor)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            
            Text(opportunity.description)
                .font(.custom("AmericanTypewriter", size: 18))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.bottom, 20)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .padding(.horizontal)
    }
}

struct Medicine_Previews: PreviewProvider {
    static var previews: some View {
        Medicine()
    }
}

