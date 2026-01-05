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
            checksum: "3dfc4887b5d8a512672641028b18aa8ef81e4e8652ed6d38ece86d6e800b4303"
        ),
        .target(
            name: "oneSDK",
            dependencies: [
                "oneSDKBranch"
            ],
            linkerSettings: [
                .linkedFramework("Security"),
                .linkedFramework("Accounts"),
                .linkedFramework("Social"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("WebKit")
            ]
        ),
        .testTarget(
            name: "oneSDKTests",
            dependencies: ["oneSDK"]
        ),
    ]
)