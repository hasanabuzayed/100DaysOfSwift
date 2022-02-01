//
//  View+Watermark.swift
//  Project_19
//
//  Created by Hasan Abuzayed on 1/31/22.
//

import SwiftUI

struct Watermark<V: View>: ViewModifier {
    let overlay: () -> V
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            overlay()
                .foregroundColor(.white)
                .padding(5)
                .background(.black.opacity(0.3))
        }
    }
}

extension View {
    @ViewBuilder func watermark<V: View>(content: @escaping () -> V) -> some View {
        self.modifier(Watermark(overlay: content))
    }
}
