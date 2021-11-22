//
//  Question.swift
//  Challenge_03
//
//  Created by Hasan Abuzayed on 11/4/21.
//

import SwiftUI

extension Int: Identifiable {
    public var id: Int { self }
}

struct Question: Identifiable {
    var id: Int { multiplier }

    let multiplicand: Int
    let multiplier: Int

    var question: String {
        "What is \(multiplicand) x \(multiplier)?"
    }

    var answer: Int {
        multiplicand * multiplier
    }
}
