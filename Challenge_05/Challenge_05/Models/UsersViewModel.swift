//
//  UsersViewModel.swift
//  Challenge_05
//
//  Created by Hasan Abuzayed on 11/28/21.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published var users: [UserViewModel] = []
    
    func load() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let users = try decoder.decode([User].self, from: data)
            DispatchQueue.main.async {                
                self.users = users.map { UserViewModel(data: $0, users: users) }
            }
        } catch let error {
            print("Invalid data. \(error.localizedDescription)")
        }
    }
}
