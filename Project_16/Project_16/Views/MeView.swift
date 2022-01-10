//
//  MeView.swift
//  Project_16
//
//  Created by Hasan Abuzayed on 1/9/22.
//

import SwiftUI

struct MeView: View {
    @StateObject private var viewModel = MeViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $viewModel.name)
                    .textContentType(.name)
                    .font(.title)
                
                TextField("Email address", text: $viewModel.emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                
                HStack {
                    Spacer()
                    Image(uiImage: viewModel.qrImage)
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .contextMenu {
                                Button {
                                    viewModel.saveQRImage()
                                } label: {
                                    Label("Save to Photos", systemImage: "square.and.arrow.down")
                                }
                            }
                    
                    Spacer()                    
                }
                .onAppear { viewModel.generateQRCode() }
                .onChange(of: viewModel.name) { _ in viewModel.generateQRCode() }
                .onChange(of: viewModel.emailAddress) { _ in viewModel.generateQRCode() }
            }
            .navigationTitle("Your code")
        }
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
