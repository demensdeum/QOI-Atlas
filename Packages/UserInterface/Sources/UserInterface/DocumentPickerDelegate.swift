//
//  File.swift
//  
//
//  Created by ILIYA on 13.02.2022.
//

import Foundation
import UIKit

class DocumentPickerDelegate: NSObject, UIDocumentPickerDelegate {
    
    var fileSelected: ((URL)->())?
    
    func documentPicker(
        _ controller: UIDocumentPickerViewController,
        didPickDocumentAt url: URL
    ) {
        debugPrint("url: \(url)")
        fileSelected?(url)
    }
    
    func documentPicker(
        _ controller: UIDocumentPickerViewController,
        didPickDocumentsAt urls: [URL]
    ) {
        debugPrint("urls: \(urls)")
        guard let url = urls.first else { return }
        fileSelected?(url)
    }
    
}
