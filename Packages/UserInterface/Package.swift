// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserInterface",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "UserInterface",
            targets: ["UserInterface"]),
    ],
    dependencies: [
        .package(url: "./Packages/QOI", from: "1.0.0"),
        .package(url: "./Packages/Shortcuts", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "UserInterface",
            dependencies: ["QOI", "Shortcuts"]),
        .testTarget(
            name: "UserInterfaceTests",
            dependencies: ["UserInterface"]),
    ]
)
