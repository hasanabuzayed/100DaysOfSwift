//
//  CrewMemberView.swift
//  Project_08
//
//  Created by Hasan Abuzayed on 11/10/21.
//

import SwiftUI

struct CrewMemberView: View {
    let crewMember: CrewMember
    
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .scaledToFit()
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                )
                .accessibilityLabel(Text("Astronaut Picture"))
            
            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .foregroundColor(.white)
                    .font(.headline)
                
                
                HStack(spacing: 4) {
                    if crewMember.isCommander {
                        Image(systemName: "star")
                            .symbolRenderingMode(.multicolor)
                            .symbolVariant(.fill)
                    }
                    Text(crewMember.role)
                        .foregroundColor(.secondary)
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text(crewMember.astronaut.name))
            .accessibilityValue(Text(crewMember.role))
        }
        .padding(.horizontal)
    }
}

struct CrewMemberView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        CrewMemberView(crewMember: CrewMember(role: "Commander", astronaut: astronauts["armstrong"]!))
            .preferredColorScheme(.dark)
    }
}


