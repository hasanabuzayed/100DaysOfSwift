//
//  Activity.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/16/21.
//

import Foundation

struct Activity: Codable, Identifiable {
    var id: UUID { UUID() }
    let title: String
    let description: String
    let type: ActivityType
    let tags: [Tag]
    let logs: [Log]
}
