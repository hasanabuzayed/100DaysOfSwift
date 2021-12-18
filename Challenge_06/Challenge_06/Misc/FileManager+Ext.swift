//
//  FileManager+Ext.swift
//  Project_14
//
//  Created by Hasan Abuzayed on 12/13/21.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    static var picturesDirectory: URL {
        let paths = FileManager.default.urls(for: .picturesDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func decode<T: Codable>(_ file: String) -> T? {
        let url = Self.documentsDirectory.appendingPathComponent(file).appendingPathExtension("json")
        if !fileExists(atPath: url.path) {
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from files.")
        }
        
        guard let loaded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from files.")
        }
        
        return loaded
    }
}
