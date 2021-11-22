//
//  QuestionView.swift
//  Challenge_03
//
//  Created by Hasan Abuzayed on 11/5/21.
//

import SwiftUI

struct QuestionView: View {
    let question: Question

    var body: some View {
        VStack {
            Text("WHAT IS")
                .font(.headline)
                .foregroundStyle(.thinMaterial)

            Text(String(question.multiplicand))
                .font(.system(size: 38))

            Text("x")
                .font(.headline)
                .foregroundStyle(.thinMaterial)

            Text(String(question.multiplier))
                .font(.system(size: 38))
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: .init(multiplicand: 2, multiplier: 10))
    }
}
