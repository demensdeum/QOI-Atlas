//
//  ImageZoomView.swift
//  qoi-atlas
//
//  Created by Ilia Prokhorov on 12.02.2022.
//

import SwiftUI
import PDFKit

// https://stackoverflow.com/questions/58341820/isnt-there-an-easy-way-to-pinch-to-zoom-in-an-image-in-swiftui

public struct ImageZoomView: UIViewRepresentable {
    private let image: UIImage

    public init(
        image: UIImage
    )
    {
        self.image = image
    }
    
    public func makeUIView(
        context: Context
    ) -> PDFView {
        let view = PDFView()
        return view
    }

    public func updateUIView(
        _ uiView: PDFView,
        context: Context
    ) {
        guard let page = PDFPage(image: image) else { return }
        uiView.document = PDFDocument()
        uiView.document?.insert(page, at: 0)
        uiView.autoScales = true
    }
}
