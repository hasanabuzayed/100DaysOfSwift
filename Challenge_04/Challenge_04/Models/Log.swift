//
//  Log.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/16/21.
//

import Foundation

struct Log: Codable, Identifiable {
    var id: UUID { UUID() }
    let date: Date
}
