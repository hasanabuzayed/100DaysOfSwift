//
//  Picture.swift
//  Challenge_06
//
//  Created by Hasan Abuzayed on 12/16/21.
//

import Foundation

struct Picture: Codable, Identifiable {
    let id: UUID
    let name: String
    let fileName: String
    
    init(name: String, fileName: String) {
        id = UUID()
        self.name = name
        self.fileName = fileName
    }
}
