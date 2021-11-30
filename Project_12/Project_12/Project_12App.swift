//
//  Project_12App.swift
//  Project_12
//
//  Created by Hasan Abuzayed on 11/28/21.
//

import SwiftUI

@main
struct Project_12App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ShipsView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
