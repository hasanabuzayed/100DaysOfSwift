//
//  ContentAccessibilityView.swift
//  Project_17
//
//  Created by Hasan Abuzayed on 1/18/22.
//

import SwiftUI

struct ContentAccessibilityView: View {
    var removal: ((Bool) -> Void)? = nil

    var body: some View {
        VStack {
            Spacer()

            HStack {
                Button {
                    withAnimation {
                        removal?(true)
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .padding()
                        .background(.black.opacity(0.7))
                        .clipShape(Circle())
                }
                .accessibilityLabel("Wrong")
                .accessibilityHint("Mark your answer as being incorrect.")

                Spacer()
                
                Button {
                    withAnimation {
                        removal?(false)
                    }
                } label: {
                    Image(systemName: "checkmark.circle")
                        .padding()
                        .background(.black.opacity(0.7))
                        .clipShape(Circle())
                }
                .accessibilityLabel("Correct")
                .accessibilityHint("Mark your answer as being correct.")
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
        }
    }
}

struct ContentAccessibilityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentAccessibilityView()
    }
}
