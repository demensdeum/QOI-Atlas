// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QOI",
    products: [
        .library(
            name: "QOI",
            targets: ["QOI"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "QOI",
            dependencies: []),
        .testTarget(
            name: "QOITests",
            dependencies: ["QOI"]),
    ]
)
