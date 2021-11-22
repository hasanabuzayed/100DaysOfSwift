//
//  ContentView.swift
//  Project_10
//
//  Created by Hasan Abuzayed on 11/18/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = OrderViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $viewModel.order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(viewModel.order.quantity)", value: $viewModel.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle(isOn: $viewModel.order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    
                    if viewModel.order.specialRequestEnabled {
                        Toggle(isOn: $viewModel.order.extraFrosting) {
                            Text("Extra Frosting")
                        }
                        
                        Toggle(isOn: $viewModel.order.addSprinkles) {
                            Text("Add Sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(viewModel: viewModel)
                    } label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
