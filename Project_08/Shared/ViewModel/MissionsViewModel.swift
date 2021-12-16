//
//  MissionsViewModel.swift
//  Project_08
//
//  Created by Hasan Abuzayed on 11/10/21.
//

import Foundation

struct MissionsViewModel {
    enum DisplayMode {
        case grid, list
        
        mutating func toggled() {
            switch self {
            case .grid:
                self = .list
            case .list:
                self = .grid
            }
        }
        
        var image: String {
            switch self {
            case .grid:
                return "square.grid.2x2"
            case .list:
                return "rectangle.grid.1x2"
            }
        }
        
        var accessibilityLabel: String {
            switch self {
            case .grid:
                return "Grid View"
            case .list:
                return "List View"
            }
        }
    }
    
    private static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    private static let _missions: [Mission] = Bundle.main.decode("missions.json")
    
    let missions: [MissionDetailsViewModel]
    var displayMode: DisplayMode = .grid
    
    init() {
        let findCrewDetails: ([CrewRole]) -> [CrewMember] = { crew in
            crew.map { member in
                guard let astronaut = Self.astronauts[member.name] else {
                    fatalError("Missing \(member.name)")
                }
                
                return CrewMember(role: member.role, astronaut: astronaut)
            }
        }
        
        self.missions = Self._missions.map { mission in
            MissionDetailsViewModel(mission: mission, crewMembers: findCrewDetails(mission.crew))
        }
    }
}
