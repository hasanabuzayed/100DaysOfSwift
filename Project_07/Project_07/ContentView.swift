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
                Section("Personal") {
                    ForEach(expenses.personalItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: item.currency))
                                .foregroundColor(expenses.colorFor(amount: item.amount))
                        }
                    }
                    .onDelete(perform: expenses.removePersonalItems)
                }

                Section("Busniess") {
                    ForEach(expenses.busniessItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: item.currency))
                                .foregroundColor(expenses.colorFor(amount: item.amount))
                        }
                    }
                    .onDelete(perform: expenses.removeBusniessItems)
                }
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


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
