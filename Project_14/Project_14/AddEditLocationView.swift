//
//  AddEditLocationView.swift
//  Project_14
//
//  Created by Hasan Abuzayed on 12/13/21.
//

import SwiftUI

struct AddEditLocationView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel: AddEditViewModel
    var onSave: (Location) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby...") {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading...")
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ")
                            + Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = viewModel.location
                    newLocation.name = viewModel.name
                    newLocation.description = viewModel.description
                    onSave(newLocation)

                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
}

struct AddEditLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddEditLocationView(viewModel: .init(location: .example)) { _ in }
    }
}
