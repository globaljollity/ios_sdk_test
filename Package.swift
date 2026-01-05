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
        .package(url: "https://github.com/facebook/facebook-ios-sdk.git", from: "9.0.0"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS.git", from: "8.0.0"),
        .package(url: "https://github.com/adjust/ios_sdk.git", from: "5.4.0")
    ],
    targets: [
        .binaryTarget(
            name: "oneSDKBranch",
            url: "https://github.com/globaljollity/ios_sdk_test/raw/main/oneSDK.xcframework.zip",
            checksum: "a9bde603cc066e3e4766cc740e0fc248e6bfe02eca70a423ad274b100cb824e9"
        ),
        .target(
            name: "oneSDK",
            dependencies: [
                "oneSDKBranch",
                .product(name: "FacebookCore", package: "facebook-ios-sdk"),
                .product(name: "FacebookLogin", package: "facebook-ios-sdk"),
                .product(name: "FacebookShare", package: "facebook-ios-sdk"),
                .product(name: "FacebookGamingServices", package: "facebook-ios-sdk"),
                .product(name: "AdjustGoogleOdm", package: "ios_sdk"),
                .product(name: "AdjustSdk", package: "ios_sdk"),
                .product(name: "AdjustWebBridge", package: "ios_sdk"),
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
                .product(name: "GoogleSignInSwift", package: "GoogleSignIn-iOS")
            ]
        ),
        .testTarget(
            name: "oneSDKTests",
            dependencies: ["oneSDK"]
        ),
    ]
)
