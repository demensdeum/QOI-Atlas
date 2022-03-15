//
//  QOIImage.swift
//  qoi-atlas (iOS)
//
//  Created by Ilia Prokhorov on 08.02.2022.
//

import Foundation
import UIKit

public class QOIImage {
    static private let BytesPerColorCount = 4
    static private let BitsPerColorComponent = 8
    
    private var width: Int = 0
    private var height: Int = 0
    private var pointer: UnsafeMutableRawPointer?
    private var image: UIImage?
    
    public init() {}
    
    public func load(path: String) {
        guard let data = try? Data(
            contentsOf: URL(
                fileURLWithPath: path
            )
        ) else {
            return
        }
        let bytes = data.bytes
        let arrayRef = ArrayRef(data.bytes)
        
        let qoiImage = QOIDecoder()
        if qoiImage.decode(arrayRef, bytes.count) {
            
            width = qoiImage.getWidth()
            height = qoiImage.getHeight()
            
            let count = Self.BytesPerColorCount * width * height
            pointer = UnsafeMutableRawPointer.allocate(
                byteCount: count,
                alignment: MemoryLayout<UInt8>.alignment
            )
            
            guard let pointer = pointer else { return }
            guard let pixels = qoiImage.getPixels() else { return }
            
            for item in pixels.makeIterator().enumerated() {
                let uint32 = UInt32(truncatingIfNeeded: item.element)
                
                let red = UInt8(truncatingIfNeeded: (uint32 & 0x00FF0000) >> 16)
                let green = UInt8(truncatingIfNeeded: (uint32 & 0x0000FF00) >> 8)
                let blue = UInt8(truncatingIfNeeded: uint32 & 0x000000FF)
                let alpha = UInt8(0xFF)
                
                var pointer = pointer + item.offset * Self.BytesPerColorCount
                pointer.storeBytes(of: red, as: UInt8.self)

                pointer += 1
                pointer.storeBytes(of: green, as: UInt8.self)

                pointer += 1
                pointer.storeBytes(of: blue, as: UInt8.self)

                pointer += 1
                pointer.storeBytes(of: alpha, as: UInt8.self)
            }
        }
    }
    
    public func asImage() -> UIImage? {
        if let image = image {
            return image
        }
        else {
            guard let colorSpace = CGColorSpace(
                name: CGColorSpace.sRGB
            ) else {
                return nil
            }
            let bytesPerRow = width * Self.BytesPerColorCount
            guard let context = CGContext(
                data: pointer,
                width: width,
                height: height,
                bitsPerComponent: Self.BitsPerColorComponent,
                bytesPerRow: bytesPerRow,
                space: colorSpace,
                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
            ) else {
                return nil
            }
            guard let cgImage = context.makeImage() else {
                return nil
            }
            let image = UIImage(cgImage: cgImage)
            self.image = image
            pointer?.deallocate()
            
            return image
        }
    }
    
}
