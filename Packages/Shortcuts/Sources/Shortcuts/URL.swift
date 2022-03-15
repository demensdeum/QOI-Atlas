//
//  URL.swift
//  
//
//  Created by Ilia Prokhorov on 13.02.2022.
//

import Foundation

public extension URL {
    var filePath: String {
        self.withUnsafeFileSystemRepresentation { cString in
            guard let cString = cString else {
                return ""
            }
            let path = String(cString: cString)
            return path
        }
    }
}
