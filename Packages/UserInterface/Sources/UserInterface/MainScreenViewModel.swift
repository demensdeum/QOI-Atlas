//
//  File.swift
//  
//
//  Created by ILIYA on 13.02.2022.
//

import Foundation
import UIKit
import QOI

public class MainScreenViewModel: ObservableObject {
    
    @Published private(set) var image: UIImage? = nil
    @Published public var documentPickerPresented = false
    
    public init() {}
    
    public var path: String = "" {
        didSet {
            loadImage()
        }
    }
    
    private func loadImage() {
        guard path.count > 0 else { return }
        let qoiImage = QOIImage()
        qoiImage.load(path: path)
        let image = qoiImage.asImage()
        self.image = image
    }
}
