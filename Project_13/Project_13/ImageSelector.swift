//
//  ImageSelector.swift
//  Project_13
//
//  Created by Hasan Abuzayed on 12/6/21.
//

import SwiftUI

struct ImageSelector: View {
    let image: Image?
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.secondary)
            
            Text("Tap to select a picture")
                .foregroundColor(.white)
                .font(.headline)
            
            image?
                .resizable()
                .scaledToFit()
        }

    }
}
