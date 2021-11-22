//
//  CrewMemberDetailsView.swift
//  Project_08
//
//  Created by Hasan Abuzayed on 11/10/21.
//

import SwiftUI

struct CrewMemberDetailsView: View {
    let crewMember: CrewMember
    
    var body: some View {
            ScrollView {
                VStack {
                    Image(crewMember.astronaut.id)
                        .resizable()
                        .scaledToFit()

                    Text(crewMember.astronaut.description)
                        .padding()
                }
            }
            .background(.darkBackground)
            .navigationTitle(crewMember.astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
        }
}

struct CrewMemberDetailsView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        CrewMemberDetailsView(crewMember: CrewMember(role: "HA!", astronaut: astronauts["armstrong"]!))
            .preferredColorScheme(.dark)
    }
}

