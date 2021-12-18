//
//  ContentView.swift
//  Challenge_06
//
//  Created by Hasan Abuzayed on 12/16/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.pics) { pic in
                        NavigationLink {
                            DetailsView(viewModel: viewModel, pic: pic)
                        } label: {
                            RowView(viewModel: viewModel, pic: pic)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Gallary")
            .toolbar {
                ToolbarItem {
                    Button {
                        viewModel.showingImagePicker = true
                    } label: {
                        Image(systemName: "plus")
                            .accessibilityHidden(true)
                    }
                    .accessibilityLabel("Import a new Image")
                }
            }
            .sheet(isPresented: $viewModel.showingImagePicker) {
                ImagePicker(image: $viewModel.inputImage)
            }
            .sheet(isPresented: $viewModel.isImageSheetPresented) {
                NavigationView {
                    VStack(alignment: .leading, spacing: .zero) {
                        Image(uiImage: viewModel.inputImage ?? UIImage())
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .frame(maxWidth: .infinity)
                            .accessibilityHidden(true)
                        
                        TextField("Name me", text: $viewModel.imageName)
                    }
                    .navigationTitle("Name this image")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                viewModel.isImageSheetPresented = false
                            } label: {
                                Image(systemName: "xmark")
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                if let image = viewModel.inputImage, let imagePath = viewModel.imager.save(image: image) {
                                    let pic = Picture(name: viewModel.imageName, fileName: imagePath)
                                    viewModel.addPicture(pic)
                                    viewModel.isImageSheetPresented = false
                                }
                            } label: {
                                Text("Save")
                            }
                            .disabled(viewModel.imageName.isEmpty)
                        }
                    }
                }
            }
            .onChange(of: viewModel.inputImage) { newValue in
                guard let _ = newValue else { return }
                viewModel.isImageSheetPresented = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
