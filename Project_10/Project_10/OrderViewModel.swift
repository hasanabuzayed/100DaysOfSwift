//
//  OrderViewModel.swift
//  Project_10
//
//  Created by Hasan Abuzayed on 11/18/21.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var order = Order()
    
    var addressFormDisabled: Bool {
        order.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        order.streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        order.city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        order.zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
