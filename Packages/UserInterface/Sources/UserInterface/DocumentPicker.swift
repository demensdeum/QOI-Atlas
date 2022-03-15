//
//  DocumentPicker.swift
//  qoi-atlas
//
//  Created by Ilia Prokhorov on 12.02.2022.
//

import Foundation
import SwiftUI

public struct DocumentPicker: UIViewControllerRepresentable {
    
    private var fileSelected: ((URL)->())?
    private var documentPickerDelegate: DocumentPickerDelegate = .init()
    
    public init(fileSelected: ((URL)->())?) {
        self.fileSelected = fileSelected
    }
    
    public func makeUIViewController(
        context: UIViewControllerRepresentableContext<DocumentPicker>
    ) -> UIDocumentPickerViewController {
        documentPickerDelegate.fileSelected = fileSelected
        let picker = UIDocumentPickerViewController(
            documentTypes: ["com.qoi"],
            in: .open
        )
        picker.allowsMultipleSelection = false
        picker.delegate = documentPickerDelegate
        return picker
    }
    
    public func updateUIViewController(
        _ uiViewController: DocumentPicker.UIViewControllerType,
        context: UIViewControllerRepresentableContext<DocumentPicker>
    ) {
    }
}
