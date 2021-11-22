//
//  GameView.swift
//  Challenge_03
//
//  Created by Hasan Abuzayed on 11/4/21.
//

import SwiftUI



struct GameView: View {
    @State var viewModel: GameViewModel
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(stops: [
                .init(color: .init(red: 0.1, green: 0.2, blue: 0.45), location: 0.25),
                .init(color: .init(red: 0.76, green: 0.15, blue: 0.26), location: 0.25),
            ]),
                           center: .top,
                           startRadius: 200,
                           endRadius: 700)
                .background(.thinMaterial)
                .ignoresSafeArea()

            VStack {
                QuestionView(question: viewModel.questions[viewModel.currentQuestionIdx])

                Spacer()

                TextField("You anwser", text: $viewModel.answer)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Spacer()
                Spacer()
                Spacer()
            }
            .onSubmit {
                if viewModel.isDone {
                    viewModel.alertTitle = "Done"
                    viewModel.alertMessage = "Score: \(viewModel.correctAnswersCount * 2)"
                    viewModel.showAlert = true
                } else {
                    withAnimation {
                        viewModel.nextQuestion()
                    }
                }
            }
            .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
                Button("Start again") {
                    isPresented = false
                }
            } message: {
                Text(viewModel.alertMessage)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: .init(questions: []), isPresented: .constant(false))
    }
}
