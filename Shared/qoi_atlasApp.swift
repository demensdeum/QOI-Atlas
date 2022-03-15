//
//  qoi_atlasApp.swift
//  Shared
//
//  Created by Ilia Prokhorov on 06.02.2022.
//

import SwiftUI
import UserInterface
import Shortcuts

@main
struct qoi_atlasApp: App {
    
    var body: some Scene {
        WindowGroup {
            let viewModel = MainScreenViewModel()
            MainScreen(
                viewModel: viewModel
            )
                .onOpenURL { url in
                    viewModel.path = url.filePath
                    viewModel.documentPickerPresented = false
                }
        }
    }
}
