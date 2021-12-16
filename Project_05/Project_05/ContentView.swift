//
//  ContentView.swift
//  Project_05
//
//  Created by Hasan Abuzayed on 11/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $viewModel.newWord)
                        .autocapitalization(.none)
                }

                Section {
                    ForEach(viewModel.usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(word)
                        .accessibilityHint("\(word.count) letters")
                    }
                }
            }
            .navigationTitle(viewModel.rootWord)
            .onSubmit {
                viewModel.addNewWord()
            }
            .onAppear {
                viewModel.startGame()
            }
            .alert(viewModel.errorTitle, isPresented: $viewModel.showError) {
                Button("OK", role: .cancel)  { }
            } message: {
                Text(viewModel.errorMessage)
            }
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button("Reset Game") {
                        viewModel.startGame()
                    }
                }
                ToolbarItemGroup(placement: .status) {
                    Text("Score: \(viewModel.score)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
