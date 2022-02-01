//
//  FavoritesViewModel.swift
//  Project_19
//
//  Created by Hasan Abuzayed on 1/28/22.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    private var resorts: Set<String>
    private let saveKey = "Favorites"

    init() {
        resorts = FileManager.decode("SavedData", default: Set())
    }

    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        FileManager.save(resorts, file: "SavedData")
    }
}
