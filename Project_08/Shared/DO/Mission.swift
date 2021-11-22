//
//  Mission.swift
//  Project_08
//
//  Created by Hasan Abuzayed on 11/10/21.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String { "Apollo \(id)" }
    
    var image: String { "apollo\(id)" }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
