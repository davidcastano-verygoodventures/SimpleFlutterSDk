// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SimpleFlutterSDk",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SimpleFlutterSDk",
            targets: ["SimpleFlutterSDk"]
        ),
    ],
    targets: [
        // Binary targets: your prebuilt frameworks
        .binaryTarget(
            name: "Flutter",
            path: "Flutter.xcframework"
        ),
        .binaryTarget(
            name: "App",
            path: "App.xcframework"
        ),
        // Wrapper target: nice Swift API that uses Flutter + App
        .target(
            name: "SimpleFlutterSDk",
            dependencies: [
                "Flutter",
                "App"
            ],
            path: "Sources/SimpleFlutterSDk"
        )
    ]
)
