//
//  FriendRowView.swift
//  Challenge_05
//
//  Created by Hasan Abuzayed on 11/29/21.
//

import SwiftUI

struct FriendRowView: View {
    let viewModel: FriendViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 4) {
                Text(viewModel.user.name)
                    .font(.headline)
                if viewModel.user.isActive {
                    Image(systemName: "checkmark")
                        .symbolVariant(.circle.fill)
                        .foregroundColor(.green)
                }
                Spacer()
                Image(systemName: "chevron.right")
            }

            Label {
                Text(viewModel.user.company)
            } icon: {
                Image(systemName: "building")
            }
        }
        .padding(.top)
        .foregroundColor(.black)
    }
}

struct FriendRowView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRowView(viewModel: .init(user: .sample))
    }
}
