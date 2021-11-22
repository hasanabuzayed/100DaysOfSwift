//
//  AddressView.swift
//  Project_10
//
//  Created by Hasan Abuzayed on 11/18/21.
//
import SwiftUI

struct AddressView: View {
    @ObservedObject var viewModel: OrderViewModel
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $viewModel.order.name)
                
                TextField("Street Address", text: $viewModel.order.streetAddress)
                
                TextField("City", text: $viewModel.order.city)
                
                TextField("Zip Code", text: $viewModel.order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(viewModel: viewModel)) {
                    Text("Check out")
                }
            }
            .disabled(viewModel.addressFormDisabled)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(viewModel: OrderViewModel())
    }
}
