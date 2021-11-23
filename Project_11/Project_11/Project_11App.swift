//
//  Project_11App.swift
//  Project_11
//
//  Created by Hasan Abuzayed on 11/22/21.
//

import SwiftUI

@main
struct Project_11App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            BooksView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
