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
}
