// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Shortcuts",
    products: [
        .library(
            name: "Shortcuts",
            targets: ["Shortcuts"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Shortcuts",
            dependencies: []),
        .testTarget(
            name: "ShortcutsTests",
            dependencies: ["Shortcuts"]),
    ]
)
