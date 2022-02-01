//
//  ContentViewModel.swift
//  Project_19
//
//  Created by Hasan Abuzayed on 1/28/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    enum Order: CaseIterable {
        case `default`, alphabetical, country, runs
        var title: String {
            switch self {
            case .default:
                return "Default"
            case .alphabetical:
                return  "Alphabetically"
            case .country:
                return "Country"
            case .runs:
                return "Runs"
            }
        }
    }
    private let resortsArr: [Resort]
    @Published private(set) var resorts: [Resort]
    @Published private(set) var favorites = FavoritesViewModel()

    init() {
        resortsArr = Bundle.main.decode("resorts.json")
        resorts = resortsArr
    }
    
    func search(for text: String) {
        resorts = text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? resortsArr
        : resortsArr.filter { $0.name.localizedCaseInsensitiveContains(text) }
    }
    
    func sort(by order: Order) {
        resorts = order == .default ? resortsArr : resortsArr.sorted { lhs, rhs in
            switch order {
            case .alphabetical:
                return lhs.name < rhs.name
            case .country:
                return lhs.country < rhs.country
            case .runs:
                return lhs.runs < rhs.runs
            default:
                return false
            }
        }
    }
}
