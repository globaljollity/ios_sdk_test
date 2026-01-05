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
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "oneSDKBranch",
            url: "https://github.com/globaljollity/ios_sdk_test/raw/main/oneSDK.xcframework.zip",
            checksum: "f1a789b928c5002859e4c01a6dec7c503c8fc5ac2e0c1521a9a8d89a4c2202ca"
        ),
        .target(
            name: "oneSDK",
            dependencies: [
                "oneSDKBranch" // 仅依赖二进制包，无其他第三方依赖
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