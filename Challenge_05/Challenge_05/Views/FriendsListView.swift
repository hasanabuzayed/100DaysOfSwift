//
//  FriendsListView.swift
//  Challenge_05
//
//  Created by Hasan Abuzayed on 11/29/21.
//

import SwiftUI

struct FriendsListView: View {
    let viewModel: FriendsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text("Friends")
                .font(.title)
            
            ForEach(viewModel.viewModels, id: \.user.id) { viewModel in
                NavigationLink {
                    UserDetailsView(viewModel: .init(data: viewModel.user))
                } label: {
                    FriendRowView(viewModel: viewModel)
                }
            }
        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView(viewModel: .init(data: [.init(id: User.sample.id, name: "Friend")], users: [.sample]))
    }
}
