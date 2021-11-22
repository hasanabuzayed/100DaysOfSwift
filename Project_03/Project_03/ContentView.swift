//
//  ContentView.swift
//  Project_03
//
//  Created by Hasan Abuzayed on 10/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .prominentText()
            .padding()
    }
}

extension View {
    func prominentText() -> some View {
        self.modifier(ProminentText())
    }
}

struct ProminentText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
