//
//  MissionDetailsViewModel.swift
//  Project_08
//
//  Created by Hasan Abuzayed on 11/10/21.
//

import Foundation

struct CrewMember {
    let role: String
    let astronaut: Astronaut
    var isCommander: Bool { role.contains("Commander")}
}

struct MissionDetailsViewModel: Identifiable {
    var id: Int { mission.id }
    let mission: Mission
    let crewMembers: [CrewMember]
    
    var formattedLaunchDate: String {
        mission.launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A"
    }
}
