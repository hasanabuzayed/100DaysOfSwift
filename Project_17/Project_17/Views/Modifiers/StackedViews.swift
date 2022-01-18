//
//  StackedViews.swift
//  Project_17
//
//  Created by Hasan Abuzayed on 1/17/22.
//

import SwiftUI

extension View {
    @ViewBuilder
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        self.offset(x: 0, y: offset * 10)
    }
}
