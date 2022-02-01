//
//  FileManager+Ex.swift
//  Project_16
//
//  Created by Hasan Abuzayed on 1/10/22.
//

import Foundation

extension FileManager {
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    class func fileExists(_ filePath: String) -> Bool {
        var isDirectory = ObjCBool(false)
        return self.default.fileExists(atPath: filePath, isDirectory: &isDirectory)
    }
}
