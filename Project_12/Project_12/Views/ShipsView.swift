//
//  ShipsView.swift
//  Project_12
//
//  Created by Hasan Abuzayed on 11/28/21.
//

import SwiftUI
import CoreData

struct ShipsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var shipNameFilter = "E"
    
    @FetchRequest(
        sortDescriptors: [],
        predicate: NSPredicate(format: "universe == 'Star Wars'"),
        animation: .default)
    private var ships: FetchedResults<Ship>
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Filter", selection: $shipNameFilter) {
                    ForEach(["E", "M", "D"], id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                FilteredList(predicate: NSPredicate(format: "name BEGINSWITH[c] %@", shipNameFilter)) { (ship: Ship) in
                    NavigationLink {
                        Text(ship.universe ?? "Unknown")
                    } label: {
                        Text(ship.name ?? "Unknown")
                    }
                }
//                List {
//                    Text("Select a ship")
//
//                    ForEach(ships) { ship in
//                        NavigationLink {
//                            Text(ship.universe ?? "Unknown")
//                        } label: {
//                            Text(ship.name ?? "Unknown")
//                        }
//                    }
//                    .onDelete(perform: deleteItems)
//                }
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
            .navigationTitle("Ships")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Ship(context: viewContext)
            let date = Date()
            newItem.name = "Ship \(date)"
            newItem.universe = "Universe \(date)"
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { ships[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShipsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
