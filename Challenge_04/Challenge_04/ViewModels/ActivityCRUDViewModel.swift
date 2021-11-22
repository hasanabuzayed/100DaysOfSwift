//
//  ActivityCRUDViewModel.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/17/21.
//

import Foundation

struct ActivityCRUDViewModel {
    var title: String = ""
    var description: String = ""
    var type: ActivityType = .build
    var tag: String = ""

    var tags: [Tag] = []

    mutating func addTag() {
        tags.append(.init(name: tag))
        tag = ""
    }

    func build() -> Activity {
        Activity(title: title, description: description, type: type, tags: tags, logs: [])
    }
}
