// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Cinotify",
    products: [
        .library(
            name: "Cinotify",
            targets: ["Cinotify"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Cinotify",
            dependencies: []),
    ]
)
