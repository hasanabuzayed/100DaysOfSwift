//
//  ExpenseItem.swift
//  Project_07
//
//  Created by Hasan Abuzayed on 11/8/21.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
}
