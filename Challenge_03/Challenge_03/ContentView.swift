//
//  ContentView.swift
//  Challenge_03
//
//  Created by Hasan Abuzayed on 11/4/21.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ContentViewModel()
    @State private var isGameActive = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select a multiplication table",
                           selection: $viewModel.selectedTable) {
                        ForEach(viewModel.kMultiplicationTablesOptions) { tableName in
                            Text("Table \(tableName)")
                        }
                    }
                }

                Section("Number of Questions") {
                    Picker("Number of Questions", selection: $viewModel.selectedQuestionCount) {
                        ForEach(viewModel.kTotalQuestionsOptions) { total in
                            Text("\(total)")
                        }
                    }
                        .pickerStyle(.segmented)
                }

                NavigationLink(isActive: $isGameActive) {
                    GameView(viewModel: GameViewModel(questions: viewModel.buildQuestions()), isPresented: $isGameActive)
                } label: {
                    Text("Start Game!")
                }
            }
            .navigationTitle("It's fun time!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
