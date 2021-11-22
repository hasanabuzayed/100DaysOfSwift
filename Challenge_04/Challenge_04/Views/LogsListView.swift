//
//  LogsListView.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/16/21.
//

import SwiftUI

struct LogsListView<Content: View>: View {

    @ViewBuilder
    let content: () -> Content

    var body: some View {
        VStack {
            content()
        }
    }
}

