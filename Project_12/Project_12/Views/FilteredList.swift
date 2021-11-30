//
//  FilteredList.swift
//  Project_12
//
//  Created by Hasan Abuzayed on 11/28/21.
//

import SwiftUI
import CoreData

struct FilteredList<RowView: View, Item: NSManagedObject>: View {
    @FetchRequest private var items: FetchedResults<Item>
    
    @ViewBuilder
    private var rowContentView: (Item) -> RowView
    
    init(sortDescriptors: [NSSortDescriptor] = [],
         predicate: NSPredicate,
         @ViewBuilder rowContentView: @escaping (Item) -> RowView) {
        _items = FetchRequest<Item>(sortDescriptors: sortDescriptors, predicate: predicate, animation: .default)
        self.rowContentView = rowContentView
    }
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                rowContentView(item)
            }
        }
    }
}
