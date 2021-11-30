//
//  User.swift
//  Challenge_05
//
//  Created by Hasan Abuzayed on 11/28/21.
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}

extension User {
    static let sample: User = .init(
        id: .init(),
        isActive: true,
        name: "John Smith",
        age: 29,
        company: "My Company",
        email: "foo@email.org",
        address: "123 Street Blvd, City, St, 65432",
        about: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris in tortor in nunc pulvinar efficitur eget eu dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu est vel orci condimentum gravida. Phasellus scelerisque neque quis gravida semper. Vestibulum condimentum, nisi et posuere pretium, sapien magna sollicitudin dolor, quis aliquet dolor turpis sit amet nulla. Integer ut eros consectetur, aliquam lectus a, mollis lectus. Morbi tincidunt et metus non iaculis.
""",
        registered: .now,
        tags: ["tag", "tag2"],
        friends: []
    )
}
