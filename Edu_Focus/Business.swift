//
//  Business.swift
//  Edu_Focus
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI

struct Business: View {
    @Environment(\.openURL) private var openURL
    
    @State private var selectedAgeGroup = "All"
    
    let opportunities = [
        Opportunity(
            title: "Beta Camp",
            url: "https://www.beta.camp/",
            description: "-for high school students\n-4 week virtual entrepreneurship program where teens build a real business - from ideation to revenue.",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Development School for Youth",
            url: "https://allstars.org/programs/dsy/",
            description: "-for high school students\n-program where attendees attend workshops and trainings, and then they get placed in six-week paid virtual summer internships",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Virtual Summer Business Academy",
            url: "https://academies.hsa.net/pages/virtual-business?gclid=Cj0KCQjw98ujBhCgARIsAD7QeAjMDejOIqmaYln8govbeD4e5aKcVWiuBOq-OqE88BJXC-0rm9rqpDoaAgabEALw_wcB",
            description: "-for 8th-12th grade students\n-program where students will learn how to manage and scale a business, and explore the challenge of transforming ideation into the solutions of tomorrow",
            ageGroup: "Middle School, High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Berkely Business Academy for Youth",
            url: "https://haas.berkeley.edu/business-academy/#:~:text=B%2DBAY%20students%20learn%20from,the%20vibrant%20UC%20Berkeley%20campus.B",
            description: "-for middle and high school students\n-program which introduces youth to the disciplines and skills that make business work",
            ageGroup: "Middle School, High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Bay Area Summer Entrepreneurship Program",
            url: "https://www.launchx.com/programs/bay-area-entrepreneurship",
            description: "-for high school students\n-gives students hands-on practical experience to start a real company. start, solve, and ship your product in just 4 short weeks in the famous Bay Area.",
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

struct Business_Previews: PreviewProvider {
    static var previews: some View {
        Business()
    }
}
