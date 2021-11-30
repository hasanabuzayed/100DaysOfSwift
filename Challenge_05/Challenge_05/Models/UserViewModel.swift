//
//  UserViewModel.swift
//  Challenge_05
//
//  Created by Hasan Abuzayed on 11/28/21.
//

import Foundation

class UserViewModel {
    let data: User
    let friends: FriendsViewModel
    
    init(data: User, users: [User] = []) {
        self.data = data
        self.friends = FriendsViewModel(data: data.friends, users: users)
    }
}

extension UserViewModel {
    static let sample: UserViewModel = .init(
        data: .sample,
        users: []
    )
}
