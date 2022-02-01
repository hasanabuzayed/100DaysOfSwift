//
//  ContentView.swift
//  Project_19
//
//  Created by Hasan Abuzayed on 1/27/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ResortListView(resorts: viewModel.resorts)
                .searchable(text: $searchText, prompt: "Search for a resort")
                .navigationTitle("Resorts")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Menu {
                            Text("Sort by:")
                            
                            ForEach(0..<ContentViewModel.Order.allCases.count) { index in
                                let orderType = ContentViewModel.Order.allCases[index]
                                Button(orderType.title) {
                                    viewModel.sort(by: orderType)
                                }
                            }
                        } label: {
                            Label("Sort", systemImage: "list.bullet")
                        }
                    }
                }
            
            
            WelcomeView()
        }
        .onChange(of: searchText, perform: viewModel.search)
        .environmentObject(viewModel.favorites)
        
        //        .phoneOnlyStackNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
