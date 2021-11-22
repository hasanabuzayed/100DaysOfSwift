//
//  Tag.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/17/21.
//

import Foundation

struct Tag: Codable, Identifiable {
    var id: UUID { UUID() }
    let name: String
}
