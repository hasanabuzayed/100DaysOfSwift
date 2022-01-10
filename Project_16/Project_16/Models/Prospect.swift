//
//  Prospect.swift
//  Project_16
//
//  Created by Hasan Abuzayed on 1/9/22.
//

import Foundation

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
    var updated = Date()
}
