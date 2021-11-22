//
//  AnswerView.swift
//  Challenge_03
//
//  Created by Hasan Abuzayed on 11/5/21.
//

import SwiftUI

struct AnswerView: View {
    let state: GameViewModel.AnswerState

    var body: some View {
        switch state {
        case .correct:
            EmptyView()
        case .incorrect:
            EmptyView()
        case .none:
            EmptyView()
        }
    }
}
