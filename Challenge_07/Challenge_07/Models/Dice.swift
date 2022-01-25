//
//  Dice.swift
//  Challenge_07
//
//  Created by Hasan Abuzayed on 1/24/22.
//

import Foundation

enum Dice: Int, CaseIterable, Identifiable, Codable {
    case four = 4
    case six = 6
    case eight = 8
    case ten = 10
    case twelve = 12
    case twenty = 20
    case hundred = 100
    
    var id: Int { rawValue }
}
