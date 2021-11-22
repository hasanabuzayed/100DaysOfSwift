//
//  Expenses.swift
//  Project_07
//
//  Created by Hasan Abuzayed on 11/8/21.
//

import SwiftUI

class Expenses: ObservableObject {
    @Published var personalItems: [ExpenseItem] = [] {
        didSet {
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(personalItems) {
                UserDefaults.standard.set(encoded, forKey: "PersonalItems")
            }
        }
    }

    @Published var busniessItems: [ExpenseItem] = [] {
        didSet {
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(busniessItems) {
                UserDefaults.standard.set(encoded, forKey: "BusniessItems")
            }
        }
    }

    init() {
        if let savedPersonalItems = UserDefaults.standard.data(forKey: "PersonalItems"),
           let savedBusniessItems = UserDefaults.standard.data(forKey: "BusniessItems") {
            if let decodedPersonalItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedPersonalItems),
               let decodedBusniessItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedBusniessItems){
                personalItems = decodedPersonalItems
                busniessItems = decodedBusniessItems
                return
            }
        }

        personalItems = []
        busniessItems = []
    }

    func add(item: ExpenseItem, forType type: ExpenseType) {
        switch type {
        case .business:
            busniessItems.append(item)
        case .personal:
            personalItems.append(item)
        }
    }

    func removePersonalItems(at offsets: IndexSet) {
        personalItems.remove(atOffsets: offsets)
    }

    func removeBusniessItems(at offsets: IndexSet) {
        busniessItems.remove(atOffsets: offsets)
    }

    func colorFor(amount: Double) -> Color {
        switch amount {
        case .zero:
            return .gray
        case ...10:
            return .green
        case ...100:
            return .orange
        case 100...:
            return .red
        default:
            return .black
        }
    }
}
