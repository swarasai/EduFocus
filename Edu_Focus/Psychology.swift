//
//  Psychology.swift
//  Edu_Focus
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI

struct Psychology: View {
    @Environment(\.openURL) private var openURL
    
    @State private var selectedAgeGroup = "All"
    
    let opportunities = [
        Opportunity(
            title: "Youth Mental Health Academy",
            url: "https://childmind.org/youth-mental-health-academy/",
            description: "-for rising high school juniors and seniors\n-program that provides hands-on learning in mental health science, practice, and communications through project-based learning, mentorships, internships, and integrated support",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Cornell Precollege Studies",
            url: "https://sce.cornell.edu/precollege/roster/psych-1101",
            description: "-for high school students\n-a broad introduction to the science of psychology: from the history of the field and its major advances, to the latest research on topics such as perception, memory, intelligence, morality, sexuality, mental illness, religion, language, and creativity. ",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Explo Pre-College Institute",
            url: "https://explo.org/precollege/explore-career/concentrations/psychology-neuroscience",
            description: "-for high schoolers\n-an introduction to behavioral neuroscience and an examination of the presumed biological bases for such illnesses",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Ladder Internships",
            url: "https://www.ladderinternships.com/",
            description: "-for high schoolers\n-program that provides high school students with virtual internship experiences at startups and nonprofits across the world.",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "CNI-X at Stanford University",
            url:"https://med.stanford.edu/psychiatry/special-initiatives/CNIX.html",
            description: "-for high schoolers\n-students attend a two-week (10-day) session which provides introductory exposure to fascinating topics in neuroscience, psychiatry and psychology plus an opportunity to complete a collaborative capstone project.",
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

struct Psychology_Previews: PreviewProvider {
    static var previews: some View {
        Psychology()
    }
}
