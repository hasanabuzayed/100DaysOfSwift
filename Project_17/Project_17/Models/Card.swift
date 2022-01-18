//
//  Card.swift
//  Project_17
//
//  Created by Hasan Abuzayed on 1/17/22.
//

import Foundation

struct Card: Codable {
    let id = UUID()
    let prompt: String
    let answer: String
}

extension Card {
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
