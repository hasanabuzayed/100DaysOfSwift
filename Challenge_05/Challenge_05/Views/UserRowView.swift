//
//  UserRowView.swift
//  Challenge_05
//
//  Created by Hasan Abuzayed on 11/29/21.
//

import SwiftUI

struct UserRowView: View {
    let viewModel: UserViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color(white: 0.95, opacity: 1))
            
            HStack(spacing: .zero) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        Text(viewModel.data.name)
                            .font(.headline)
                        if viewModel.data.isActive {
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundColor(.green)
                        }
                    }
                    
                    HStack {
                        HStack(alignment: .bottom, spacing: 2) {
                            Image(systemName: "person.3")
                            Text("\(viewModel.data.friends.count.formatted())")
                        }

                    }
                    .font(.caption)

                    HStack {
                        Text("Tags: \(viewModel.data.tags.joined(separator: ", "))")
                            .multilineTextAlignment(.leading)
                    }
                    .font(.caption)
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding()
            .foregroundColor(.black)
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(viewModel: .sample)
            .frame(height: 100)
            .previewLayout(.sizeThatFits)
    }
}
