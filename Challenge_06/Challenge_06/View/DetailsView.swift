//
//  DetailsView.swift
//  Challenge_06
//
//  Created by Hasan Abuzayed on 12/17/21.
//

import SwiftUI

struct DetailsView: View {
    let viewModel: ContentView.ViewModel
    let pic: Picture
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            if let image = viewModel.imager.loadImage(of: pic.fileName) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .accessibilityHidden(true)
                    .clipped()
            }
            
            Text(pic.name)
                .font(.headline)
                .foregroundColor(.primary)
                .accessibilityLabel(Text("Picture title"))
                .padding([.leading, .vertical])
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Details")
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(viewModel: .init(), pic: .init(name: "", fileName: ""))
    }
}
