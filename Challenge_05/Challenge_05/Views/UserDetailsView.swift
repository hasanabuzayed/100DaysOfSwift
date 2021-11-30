//
//  UserDetailsView.swift
//  Challenge_05
//
//  Created by Hasan Abuzayed on 11/29/21.
//

import SwiftUI

struct UserDetailsView: View {
    let viewModel: UserViewModel
    
    var body: some View {
        ScrollView {
            Divider()
            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    VStack(alignment: .trailing, spacing: 6) {
                        Image(systemName: "calendar")
                        Image(systemName: "person.text.rectangle")
                        Image(systemName: "envelope")
                        Image(systemName: "house")
                        Image(systemName: "building")
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Joined \(viewModel.data.registered.formatted(date: .abbreviated, time: .omitted))")
                        Text("\(viewModel.data.age) years old")
                        Text(viewModel.data.email)
                        Text(viewModel.data.address)
                        Text(viewModel.data.company)
                    }
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 16)
                
                Text("About me")
                    .font(.title.bold())
                
                Text(viewModel.data.about)
                    .multilineTextAlignment(.leading)
                    .font(.body)
                
                if !viewModel.friends.viewModels.isEmpty {
                    Spacer()
                        .frame(height: 16)
                    Divider()
                    FriendsListView(viewModel: viewModel.friends)
                }
            }
            .padding()
        }.navigationTitle(viewModel.data.name)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailsView(viewModel: .sample)
        }
    }
}
