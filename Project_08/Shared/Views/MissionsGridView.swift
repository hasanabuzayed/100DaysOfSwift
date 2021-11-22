//
//  MissionsGridView.swift
//  Project_08
//
//  Created by Hasan Abuzayed on 11/10/21.
//

import SwiftUI

struct MissionsGridView<Content: View>: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @ViewBuilder
    var content: () -> Content
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                content()
            }
            .padding([.horizontal, .bottom])
        }
        .preferredColorScheme(.dark)
    }
}

struct MissionsGridView_Previews: PreviewProvider {
    static var previews: some View {
        MissionsGridView {
            Text("")
        }
    }
}
