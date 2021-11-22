//
//  MissionsListView.swift
//  Project_08
//
//  Created by Hasan Abuzayed on 11/10/21.
//

import SwiftUI

struct MissionsListView<Content: View>: View {
    @ViewBuilder
    var content: () -> Content
    
    var body: some View {
        ScrollView {
            LazyVStack {
                content()
            }
            .padding([.horizontal, .bottom])
        }
        .preferredColorScheme(.dark)
    }
}

struct MissionsListView_Previews: PreviewProvider {
    static var previews: some View {
        MissionsListView {
            Text("")
        }
    }
}

