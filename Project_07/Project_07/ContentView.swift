//
//  ContentView.swift
//  Project_07
//
//  Created by Hasan Abuzayed on 11/8/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                buildSection(titled: "Personal", items: expenses.personalItems, onDelete: expenses.removePersonalItems)
                
                buildSection(titled: "Busniess", items: expenses.busniessItems, onDelete: expenses.removeBusniessItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    @ViewBuilder
    private func buildSection(titled title: String, items: [ExpenseItem], onDelete action: ((IndexSet) -> Void)?) -> some View {
        if items.isEmpty {
            EmptyView()
        } else {
            Section(title) {
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: item.currency))
                            .foregroundColor(expenses.colorFor(amount: item.amount))
                    }
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text(item.name))
                    .accessibilityValue(Text(item.amount, format: .currency(code: item.currency)))
                    .accessibilityHint(Text(title))
                }
                .onDelete(perform: action)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
