//
//  GameViewModel.swift
//  Challenge_03
//
//  Created by Hasan Abuzayed on 11/4/21.
//

import Foundation

struct GameViewModel {
    enum AnswerState {
        case correct
        case incorrect
        case `none`
    }

    let questions: [Question]
    var currentQuestionIdx: Int = .zero
    var answer = ""
    var correctAnswersCount: Int = .zero
    var answerState: AnswerState = .none

    // Alert
    var showAlert = false
    var alertTitle = ""
    var alertMessage = ""

    init(questions: [Question]) {
        self.questions = questions
    }

    var isDone: Bool { currentQuestionIdx == questions.count - 1 }

    mutating func nextQuestion() {
        guard currentQuestionIdx != questions.count - 1 else { return }
        registerAnswer()

        currentQuestionIdx += 1
        answer = ""
    }

    mutating func registerAnswer() {
        guard !answer.isEmpty, let answer = Int(answer) else { return }
        correctAnswersCount += answer == questions[currentQuestionIdx].answer ? 1 : 0
    }
}
