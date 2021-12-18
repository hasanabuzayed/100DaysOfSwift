//
//  Imager.swift
//  Project_13
//
//  Created by Hasan Abuzayed on 12/16/21.
//

import UIKit

struct Imager {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    private let savePath = FileManager.documentsDirectory
    
    init() { }
    
    func save(image: UIImage) -> String? {
        guard let jpegData = image.jpegData(compressionQuality: 0.8) else {
            return nil
        }
        
        
        let finalSavePath = savePath.appendingPathComponent("\(UUID().uuidString)").appendingPathExtension(for: .image)
        do {
            try jpegData.write(to: finalSavePath, options: [.atomicWrite, .completeFileProtection])
            successHandler?()
        } catch(let error) {
            errorHandler?(error)
        }
        return finalSavePath.lastPathComponent
    }
    
    func loadImage(of fileName: String) -> UIImage? {
        let image: UIImage?
        do {
            let imageData = try Data(contentsOf: savePath.appendingPathComponent(fileName).appendingPathExtension(for: .image))
            image = UIImage(data: imageData)
        } catch (let error) {
            errorHandler?(error)
            image = nil
        }
        return image
    }
}
