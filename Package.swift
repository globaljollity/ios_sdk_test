// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "oneSDK",
    products: [
        .library(
            name: "oneSDK",
            targets: ["oneSDK"]),
    ],
    dependencies: 
    ],
    targets: [
        .binaryTarget(
            name: "oneSDKBranch",
            url: "https://github.com/globaljollity/ios_sdk_test/raw/main/oneSDK.xcframework.zip",
            checksum: "14b7fb11122e57c7ec6d67b8f81f230052e9e92f3c7788e4239959cee9041aef"
        ),
        .target(
            name: "oneSDK",
            dependencies: [
                "oneSDKBranch"
            ],
            linkerSettings: [
            ]
        ),
        .testTarget(
            name: "oneSDKTests",
            dependencies: ["oneSDK"]
        ),
    ]
)