//
//  ViewModel.swift
//  Project_05
//
//  Created by Hasan Abuzayed on 11/1/21.
//

import SwiftUI

struct ViewModel {
    var usedWords: [String] = []
    var rootWord = ""
    var newWord = ""

    var errorTitle = ""
    var errorMessage = ""
    var showError = false

    var score: Int {
        guard !usedWords.isEmpty else { return .zero }
        return (usedWords.count * 3) / 2 * 4
    }

    mutating func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard !answer.isEmpty else { return }

        guard isNotShort(word: answer) else {
            wordError(title: "Word is short", message: "Word should be more than 3 characters!")
            return
        }

        guard isNotRoot(word: answer) else {
            wordError(title: "Root word", message: "Word can't be root!")
            return
        }

        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make up them up, you know!")
            return
        }

        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }

    mutating func startGame() {
        guard let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"),
              let startsWord = try? String(contentsOf: startWordsURL) else {
                  fatalError("Could not load")
              }

        let allWords = startsWord.components(separatedBy: "\n")
        rootWord = allWords.randomElement() ?? "silkworm"
        usedWords.removeAll()
        newWord = ""
    }

    private func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }

    private func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }

    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }

    private func isNotShort(word: String) -> Bool {
        word.utf16.count > 3
    }

    private func isNotRoot(word: String) -> Bool {
        rootWord != word
    }

    private mutating func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showError = true
    }
}
