//
//  Roll.swift
//  Challenge_07
//
//  Created by Hasan Abuzayed on 1/24/22.
//

import Foundation

struct Roll: Codable, Identifiable {
    let id = UUID()
    let dice: Dice
    let value: Int
}
