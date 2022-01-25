//
//  ContentView.swift
//  Challenge_07
//
//  Created by Hasan Abuzayed on 1/24/22.
//

import SwiftUI

struct ContentView: View {
    @State private var faces: Dice = .four
    @State private var timeRemaining = 0
    @State private var face: String = ""

    let timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Select Dice")
                    .font(.headline)
                Picker("Select Dice", selection: $faces) {
                    ForEach(Dice.allCases) { diceFaces in
                        Text("\(diceFaces.rawValue)")
                            .tag(diceFaces)
                    }
                }
                .pickerStyle(.segmented)
                
                HStack {
                    Spacer()
                    
                    Button {
                        timeRemaining = 30
                    } label: {
                        Label("ROLL ME", systemImage: "dice")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 6)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Spacer()
                }
                .padding(.vertical)
                
                if !face.isEmpty {
                    Text(face)
                        .font(.largeTitle)
                        .padding(.bottom)
                        .frame(maxWidth: .infinity)
                }
                
                Divider()
                    .padding(.bottom)
                
                Text("History")
                    .font(.headline)
                ForEach(0..<10) { position in
                    Text("\(position)")
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Dicey")
            .onReceive(timer) { _ in
                guard timeRemaining > 0 else { return }
                timeRemaining -= 1
                face = "\(Int.random(in: 1...faces.rawValue))"
            }
            .onChange(of: faces) { _ in
                timeRemaining = 0
                face = ""
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
