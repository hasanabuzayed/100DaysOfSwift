//
//  ContentView.swift
//  Project_18
//
//  Created by Hasan Abuzayed on 1/23/22.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(color(position: geo.frame(in: .global).midY))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5,
                                              axis: (x: 0, y: 1, z: 0))
                            .opacity(geo.frame(in: .global).minY / 200)
                            .scaleEffect((geo.frame(in: .global).midY * 2) / (fullView.size.height))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
    
    func color(position: Double) -> Color {
        let hue = abs(position).truncatingRemainder(dividingBy: 360)
        return Color(hue: hue / 360,
                     saturation: 1,
                     brightness: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
