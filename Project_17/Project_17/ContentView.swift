//
//  ContentView.swift
//  Project_17
//
//  Created by Hasan Abuzayed on 1/14/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var cards = [Card]()
    @State private var timeRemaining = 100
    @State private var isActive = true
    @State private var showingEditScreen = false
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    @Environment(\.scenePhase) var scenePhase
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) { remove in
                            withAnimation {
                                removeCard(at: index, isFinal: !remove)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                        .allowsHitTesting(index == cards.count - 1)
                        .accessibilityHidden(index < cards.count - 1)
                    }
                }
                .allowsTightening(timeRemaining > 0)
                
                if cards.isEmpty {
                    Button("Star over?") {
                        resetCards()
                    }
                    .padding()
                    .background(.white)
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                }
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        showingEditScreen = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
            
            if differentiateWithoutColor || voiceOverEnabled {
                ContentAccessibilityView() { remove in
                    withAnimation {
                        removeCard(at: cards.count - 1, isFinal: !remove)
                    }
                }
            }
        }
        .onReceive(timer) { time in
            guard isActive else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) { newPhase in
            isActive = newPhase == .active && !cards.isEmpty
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards) {
            EditCards()
        }
        .onAppear(perform: resetCards)
    }
    
    func removeCard(at index: Int, isFinal: Bool) {
        let card = cards.remove(at: index)
//        if !isFinal {
//            cards.insert(card, at: .zero)
//        }
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func resetCards() {
        timeRemaining = 100
        isActive = true
        loadData()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
