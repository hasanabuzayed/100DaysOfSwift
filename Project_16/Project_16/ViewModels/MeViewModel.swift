//
//  MeViewModel.swift
//  Project_16
//
//  Created by Hasan Abuzayed on 1/10/22.
//

import CoreImage.CIFilterBuiltins
import Foundation
import UIKit

@MainActor class MeViewModel: ObservableObject {
    @Published var name = "Anonymous"
    @Published var emailAddress = "you@yoursite.com"
    @Published var qrImage = UIImage()

    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    private let imageSaver = ImageSaver()
    
    func generateQRCode() {
        let string = "\(name)\n\(emailAddress)"
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                qrImage = UIImage(cgImage: cgimg)
                return
            }
        }

        qrImage = UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    func saveQRImage() {
        imageSaver.writeToPhotoAlbum(image: qrImage)
    }
}
