//
//  Engineering.swift
//  Edu_Focus
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI

struct Engineering: View {
    @Environment(\.openURL) private var openURL
    
    @State private var selectedAgeGroup = "All"
    
    let opportunities = [
        Opportunity(
            title: "Young Engineers in Actions",
            url: "https://www.youngengineersinaction.org/volunteering.html",
            description: "-for middle and high school students\n-volunteers can be recognized with the President’s Volunteer Service Award",
            ageGroup: "Middle School, High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "MITES",
            url: "https://mites.mit.edu/",
            description: "-for middle and high school students\n-extremely selective (4.1% acceptance rate) six-week program for highly motivated students",
            ageGroup: "Middle School, High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Try Engineer Summer Institute",
            url:"https://tryengineeringinstitute.ieee.org/",
            description: "--for high school students\n-engineering camp with a goal to spark enthusiasm in engineering and technology in the next generation of problem-solvers and difference-makers, and position these innovators for long-term success in academics and in life.",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Inspirit AI",
            url:"https://www.inspiritai.com/",
            description: "-for high schoolers\n-program provides guidance on initiating AI projects, pursuing AI ventures, and preparing for college.",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Polygence",
            url:"https://www.polygence.org/",
            description: "-for high schoolers\n-one-on-one mentorship with a researcher in the field you choose where you can earn college credit",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Code.org Volunter",
            url:"https://code.org/volunteer/guide",
            description: "-for middle and high schoolers\n-anyone with a passion for coding can volunteer to teach coding to others",
            ageGroup: "Middle School, High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Kode with Klossy",
            url:"https://www.kodewithklossy.com/",
            description: "-for middle and high schoolers\n-program designed to provide learning experiences for young women and the resources they need to pursue their passions in a tech-driven world",
            ageGroup: "Middle School, High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "COSMOS",
            url:"https://cosmos-ucop.ucdavis.edu/app/main",
            description: "-for high schoolers\n-an intensive four-week summer residential Pre-College Program for high school students who have demonstrated an aptitude for academic and professional careers in STEM subjects",
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


struct Engineering_Previews: PreviewProvider {
    static var previews: some View {
        Engineering()
    }
}

