// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharedDemo",
    platforms: [
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v7),
        .macOS(.v12),
        .visionOS(.v1)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SharedDemo",
            targets: ["SharedDemo"]),
    ],
    dependencies: [
        .package(name: "ReerUI", path: "../../"),
        .package(url: "https://github.com/reers/ReerKit.git", from: "1.1.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SharedDemo",
            dependencies: ["ReerUI", "ReerKit"],
            resources: [.process("UIShowcase/SDF.metal")]),

    ]
)
