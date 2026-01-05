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
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "oneSDKBranch",
            url: "https://github.com/globaljollity/ios_sdk_test/raw/main/oneSDK.xcframework.zip",
            checksum: "b83329c10282e25b634179a207fb524c29d764f8a1ebbc0cc670f7366ab555be"
        ),
        .target(
            name: "oneSDK",
            dependencies: [
                "oneSDKBranch"
            ]
        ),
        .testTarget(
            name: "oneSDKTests",
            dependencies: ["oneSDK"]
        ),
    ]
)
