//
//  ContentView.swift
//  Project_15
//
//  Created by Hasan Abuzayed on 12/16/21.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 10
    
    var body: some View {
        VStack {
            Text("Value: \(value)")
            Button("Increment") { value += 1 }
            Button("Decrement") { value -= 1 }
        }
        .accessibilityElement()
        .accessibilityLabel(Text("Value"))
        .accessibilityValue(Text("\(value)"))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default: print("not handled yet.")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
