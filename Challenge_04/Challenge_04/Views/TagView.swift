//
//  TagView.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/17/21.
//

import SwiftUI

struct TagView: View {
    let tag: Tag

    var body: some View {
        Text(tag.name)
            .font(.caption)
            .foregroundColor(.white)
            .padding(4)
            .background(.purple)
            .clipShape(Capsule())
    }
}

struct TagView_Provider: PreviewProvider {
    static var previews: some View {
        TagView(tag: .init(name: "Cloud"))
    }
}
