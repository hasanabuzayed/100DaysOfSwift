//
//  ContentView.swift
//  Project_01
//
//  Created by Hasan Abuzayed on 10/15/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkoutAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPersentage = 2

    private let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPersentage])
        let orderAnount = Double(checkoutAmount) ?? 0

        let tipValue = orderAnount / 100 * tipSelection
        let grandTotal = orderAnount + tipValue

        return grandTotal / peopleCount
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkoutAmount)
                        .keyboardType(.decimalPad)

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section(header: Text("How much tip do you want to leave")) {
                    Picker("tip percentage", selection: $tipPersentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")

                    if #available(iOS 15.0, *) {
                        HStack(spacing: 20) {
                            Image(systemName: "flag")
                            Image(systemName: "heart")
                            Image(systemName: "bolt")
                            Image(systemName: "star")
                        }
                        HStack(spacing: 20) {
                            Image(systemName: "flag")
                            Image(systemName: "heart")
                            Image(systemName: "bolt")
                            Image(systemName: "star")
                        }
                        .symbolVariant(.fill)
                    }
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
