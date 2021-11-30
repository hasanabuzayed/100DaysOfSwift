//
//  FriendsViewModel.swift
//  Challenge_05
//
//  Created by Hasan Abuzayed on 11/28/21.
//

import Foundation

class FriendsViewModel {
    let viewModels: [FriendViewModel]
    
    init(data: [Friend], users: [User]) {
        self.viewModels = data.compactMap { friend in
            users.first {
                $0.id == friend.id
            }
        }
        .map(FriendViewModel.init)
    }
}
