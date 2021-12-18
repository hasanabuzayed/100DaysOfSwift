//
//  ContentView+ViewModel.swift
//  Challenge_06
//
//  Created by Hasan Abuzayed on 12/16/21.
//

import Foundation
import UIKit

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var isImageSheetPresented = false
        @Published var showingImagePicker = false
        @Published var inputImage: UIImage? = nil
        @Published var imageName = ""
        
        @Published private(set) var pics: [Picture] = []
        
        private(set) var imager = Imager()
        private let savePath = FileManager.documentsDirectory.appendingPathComponent("images").appendingPathExtension("json")
        
        init() {
            pics = FileManager.default.decode("images") ?? []
            
            self.imager.errorHandler = { error in
                print("Imager error --> \(error.localizedDescription)")
            }
        }
        
        func addPicture(_ pic: Picture) {
            pics.append(pic)
            save()
        }
        
        private func save() {
            do {
                let data = try JSONEncoder().encode(pics)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data. because \(error)")
            }
        }
    }
}
