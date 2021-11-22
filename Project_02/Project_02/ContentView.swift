//
//  ContentView.swift
//  Project_02
//
//  Created by Hasan Abuzayed on 10/20/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    @State private var totalQuestionsAsked = 0
    @State private var selectedAnswer = -1

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(stops: [
                .init(color: .init(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: .init(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ]),
                           center: .top,
                           startRadius: 200,
                           endRadius: 700)
                .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(name: countries[number])
                        }
                        .rotation3DEffect(
                            .degrees(selectedAnswer != -1 && number == selectedAnswer ? 360 : 0),
                            axis: (x: 0, y: 0, z: 1)
                        )
                        .opacity(selectedAnswer != -1 && number != selectedAnswer ? 0.25 : 1)
                        .scaleEffect(selectedAnswer != -1 && number != selectedAnswer ? 0.7 : 1)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))

                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())

                Spacer()
            }
            .padding()

        }
        .alert(scoreTitle, isPresented: $showScore) {
            if totalQuestionsAsked == 10 {
                Button("Reset", role: .cancel, action: reset)
            } else {
                Button("Continue", action: askQuestion)
            }
        } message: {
            Text(scoreMessage)
        }
    }

    private func flagTapped(_ number: Int) {
        totalQuestionsAsked += 1
        withAnimation {
            selectedAnswer = number
        }

        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
            scoreMessage = "You score is \(score)"
        } else {
            if score > 0 {
                score -= 1
            }
            scoreTitle = "Wrong!"
            scoreMessage = "That’s the flag of \(countries[number])"
        }

        if totalQuestionsAsked == 10 {
            scoreMessage = "You final score is \(score)"
        }

        showScore = true
    }

    private func askQuestion() {
        countries.shuffle()
        correctAnswer = .random(in: 0..<2)
        selectedAnswer = -1
    }

    private func reset() {
        totalQuestionsAsked = 0
        score = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FlagImage: View {
    var name: String

    var body: some View {
        Image(name)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
