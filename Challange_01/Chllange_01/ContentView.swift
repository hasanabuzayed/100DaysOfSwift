//
//  ContentView.swift
//  Chllange_01
//
//  Created by Hasan Abuzayed on 10/18/21.
//

import SwiftUI

struct ContentView: View {
    enum Units: String, CaseIterable {
        case meters, kilometers, feet, yards, miles

        var type: UnitLength {
            switch self {
            case .meters: return .meters
            case .kilometers: return .kilometers
            case .feet: return .feet
            case .yards: return .yards
            case .miles: return .miles
            }
        }
    }

    @State private var amount: String = ""
    private var result: Double {
        guard let amount = Double(amount),
              let selectedBaseUnit = __selectedBaseUnit,
              let selectedConvertedUnit = __selectedConvertedUnit else { return .zero }

        let originalMeasurement = Measurement(value: amount, unit: selectedBaseUnit.type)
        return originalMeasurement.converted(to: selectedConvertedUnit.type).value
    }

    @State private var selectedBaseUnit = 0
    private var __selectedBaseUnit: Units? { Units.allCases[selectedBaseUnit] }
    @State private var selectedConvertedUnit = 1
    private var __selectedConvertedUnit: Units? { Units.allCases[selectedConvertedUnit] }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter amount", text: $amount)
                        .keyboardType(.decimalPad)

                    Picker("From", selection: $selectedBaseUnit) {
                        ForEach(0..<Units.allCases.count) {
                            Text(Units.allCases[$0].type.symbol)
                        }
                    }

                    Picker("To", selection: $selectedConvertedUnit) {
                        ForEach(0..<Units.allCases.count) {
                            Text(Units.allCases[$0].type.symbol)
                        }
                    }
                }
                Section(header: Text("Result")) {
                    Text("\(String(format: "%.2f", result)) \(__selectedConvertedUnit?.rawValue ?? "N/A")")
                }
            }
            .pickerStyle(.segmented)
            .navigationTitle("Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
