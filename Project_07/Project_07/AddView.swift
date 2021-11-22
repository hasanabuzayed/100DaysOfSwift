//
//  AddView.swift
//  Project_07
//
//  Created by Hasan Abuzayed on 11/8/21.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss

    @ObservedObject var expenses: Expenses

    @State private var name = ""
    @State private var type: ExpenseType = .personal
    @State private var amount = 0.0
    @State private var currency: Currency = .usd

    let types = ["Business", "Personal"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(ExpenseType.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)

                TextField("Amount", value: $amount, format: .currency(code: currency.rawValue))
                    .keyboardType(.decimalPad)

                Picker("Currency", selection: $currency) {
                    ForEach(Currency.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type.rawValue, amount: amount, currency: currency.rawValue)
                    expenses.add(item: item, forType: type)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
