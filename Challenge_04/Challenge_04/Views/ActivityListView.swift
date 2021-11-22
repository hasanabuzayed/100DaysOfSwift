//
//  ActivityListView.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/17/21.
//

import SwiftUI

struct ActivityListView<Content: View>: View {
    
    @ViewBuilder
    let content: () -> Content
    
    var body: some View {
        List {
            content()
        }
    }
}

