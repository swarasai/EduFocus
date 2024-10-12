//
//  Law.swift
//  Edu_Focus
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI

struct Law: View {
    @Environment(\.openURL) private var openURL
    
    @State private var selectedAgeGroup = "All"
    
    let opportunities = [
        Opportunity(
            title: "GeorgeTown University Pre-College Program",
            url: "https://georgetown.precollegeprograms.org/politics?utm_term=politics%20programs%20for%20high%20school%20students&utm_campaign=Law+CP&utm_source=adwords&utm_medium=ppc&hsa_acc=9406006711&hsa_cam=12753784223&hsa_grp=131829957035&hsa_ad=569201082876&hsa_src=g&hsa_tgt=kwd-1530980709088&hsa_kw=politics%20programs%20for%20high%20school%20students&hsa_mt=b&hsa_net=adwords&hsa_ver=3&gad=1&gclid=Cj0KCQjw98ujBhCgARIsAD7QeAhikYRrTsRrYGBvX1EYTBIOjExGioRF6_9bVdH2CkTcYtehhfcd_s8aAsu4EALw_wcB",
            description: "-for students aged 13+\n-a course that explains how the U.S. political system works",
            ageGroup: "Middle School, High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Intense Law and Trial",
            url: "https://www.envisionexperience.com/explore-our-programs/intensive-law-and-trial",
            description: "-for high schoolers\n-program that immerses students in the theory and practice of law and allows them to develop a roadmap for becoming a lawyer.",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Crump Law Camp",
            url: "https://members.nationalbar.org/NBAR/NBAR/News/2022_Virtual_Crump_Law_Camp.aspx",
            description: "-for high schoolers\n-program that offers high school students a remarkable experience to determine if they desire to pursue careers in law.",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "Center for Youth Development Through Law",
            url: "https://www.youthlawworks.org/",
            description: "-for high schoolers\n-program that promotes educational achievement, legal knowledge, and the pursuit of legal careers among people from disadvantaged and underrepresented groups",
            ageGroup: "High School",
            backgroundColor: Color(red: 1, green: 0.9176, blue: 0.8902)
        ),
        Opportunity(
            title: "California LAW Pathways",
            url: "https://calawpathways.org/",
            description: "-for high schoolers\n-program that connects, communicates, collaborates, and coordinates with programs that are part of the educational pathway for diverse students into the legal profession or law-related careers.",
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

struct Law_Previews: PreviewProvider {
    static var previews: some View {
        Law()
    }
}
