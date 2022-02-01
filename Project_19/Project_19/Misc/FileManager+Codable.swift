//
//  FileManager+Codable.swift
//  Project_19
//
//  Created by Hasan Abuzayed on 1/31/22.
//

import Foundation

extension FileManager {
    static func decode<T: Decodable>(_ file: String, default dData: T) -> T {
        let savePath = documentsDirectory.appendingPathComponent(file)
        
        if (try? Data(contentsOf: savePath)) == nil {
            try? "".data(using: .utf8)?.write(to: savePath, options: [.atomic, .completeFileProtection])
        }

        guard let data = try? Data(contentsOf: savePath) else {
            fatalError("Failed to load \(file) from directory.")
        }

        let decoder = JSONDecoder()

        return (try? decoder.decode(T.self, from: data)) ?? dData
    }
    
    @discardableResult
    static func save<T: Encodable>(_ data: T, file: String) -> Bool {
        let savePath = documentsDirectory.appendingPathComponent(file)

        let encoder = JSONEncoder()

        guard let encoded = try? encoder.encode(data) else {
            fatalError("Failed to encode \(data).")
        }

        do {
            try encoded.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            fatalError("Failed to save \(file).")
        }

        return true
    }
}
