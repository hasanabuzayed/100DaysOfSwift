//
//  RowView.swift
//  Challenge_06
//
//  Created by Hasan Abuzayed on 12/17/21.
//

import SwiftUI

struct RowView: View {
    let viewModel: ContentView.ViewModel
    let pic: Picture
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            if let image = viewModel.imager.loadImage(of: pic.fileName) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .frame(maxWidth: .infinity)
                    .accessibilityHidden(true)
                    .clipped()
            }
            Text(pic.name)
                .font(.headline)
                .foregroundColor(.primary)
                .accessibilityLabel(Text("Picture title"))
                .padding([.leading, .vertical])
        }
        .background(.secondary)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(viewModel: .init(), pic: .init(name: "", fileName: ""))
    }
}
