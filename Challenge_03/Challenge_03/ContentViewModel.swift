//
//  ContentViewModel.swift
//  Challenge_03
//
//  Created by Hasan Abuzayed on 11/4/21.
//

import Foundation

struct ContentViewModel {
    let kMultiplicationTablesOptions = Array(2...12)
    let kTotalQuestionsOptions = [5, 10, 20]

    private lazy var kMultiplicationTables: [[Int]] = {
        var tables: [[Int]] = []
        for (index, numberTable) in kMultiplicationTablesOptions.enumerated() {
            tables.append(Array(1...12))
        }
        return tables
    }()

    var selectedTable = 2
    var selectedQuestionCount = 5

    func buildQuestions() -> [Question] {
        var mutatableSelf = self //  this is a nasty unnecessary hack 🥴
        let index = selectedTable - 2
        let array = mutatableSelf.kMultiplicationTables[index].shuffled().prefix(selectedQuestionCount)
        return array.map{
            Question(
                multiplicand: kMultiplicationTablesOptions[index],
                multiplier: $0
            )
        }
    }
}
