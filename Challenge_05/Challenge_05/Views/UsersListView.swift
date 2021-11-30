//
//  ContentView.swift
//  Challenge_05
//
//  Created by Hasan Abuzayed on 11/28/21.
//

import SwiftUI

struct UsersListView: View {
    @ObservedObject var viewModel = UsersViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.users, id: \.data.id) { user in
                        NavigationLink {
                            UserDetailsView(viewModel: user)
                        } label: {
                            UserRowView(viewModel: user)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle("Users")
            .task {
                await viewModel.load()
            }
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
