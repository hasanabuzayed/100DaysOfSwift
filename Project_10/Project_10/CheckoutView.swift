//
//  CheckoutView.swift
//  Project_10
//
//  Created by Hasan Abuzayed on 11/18/21.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var viewModel: OrderViewModel
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                .accessibilityElement(children: .ignore)
                
                Text("Your total cost is \(viewModel.order.cost.formatted(.currency(code: "USD")))")
                
                Button("Place order") {
                    placeOrder()
                }
                .padding()
            }
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(viewModel.order) else {
            print("Failed to encode order")
            return
        }
        
        guard let url = URL(string: "https://reqres.in/api/cupcakes") else {
            print("Failed to make url")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                self.alertTitle = "⚠️ Error"
                self.alertMessage = "No data in response: \(error?.localizedDescription ?? "Unknown error")."
                self.showingAlert = true
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.alertTitle = "Thank YOU!"
                self.alertMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            } else {
                self.alertTitle = "⚠️ Error"
                self.alertMessage = "Invalid response from the server"
            }
            self.showingAlert = true
        }
        .resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(viewModel: OrderViewModel())
    }
}
