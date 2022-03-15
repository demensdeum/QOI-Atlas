//
//  Array.swift
//  qoi-atlas
//
//  Created by Ilia Prokhorov on 12.02.2022.
//

import Foundation

public extension Array {
    func at(
        _ index: Int
    ) -> Element? {
        guard index >= 0, index < count else { return nil }
        return self[index]
    }
}
