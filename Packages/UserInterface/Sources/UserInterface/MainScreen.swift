//
//  TestScreen.swift
//  qoi-atlas (iOS)
//
//  Created by Ilia Prokhorov on 08.02.2022.
//

import SwiftUI
import QOI
import Shortcuts

public struct MainScreen: View {
    
    @ObservedObject private var viewModel: MainScreenViewModel
    
    public init(
        viewModel: MainScreenViewModel
    ) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            if let image = viewModel.image {
                ImageZoomView(
                    image: image
                )
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
            }
            Button(
                action: {
                    self.viewModel.documentPickerPresented.toggle()
                }
            ) {
                Text("Tap Here to Open QOI Image")
            }
            .sheet(
                isPresented: self.$viewModel.documentPickerPresented
            ) {
                DocumentPicker(
                    fileSelected: { url in
                        viewModel.path = url.filePath
                    }
                )
            }
            .frame(
                height: 20,
                alignment: .center
            )
        }
        .padding()
        
    }
    
}
