// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "oneSDK",
    products: [
        .library(
            name: "oneSDK",
            type: .static, // 静态库合并符号，避免外部暴露
            targets: ["oneSDK"]
        ),
    ],
    dependencies: [
        // 【彻底清空】：删除所有 Facebook、GoogleSignIn、Adjust 的依赖声明
        // 不再通过 SPM 拉取任何第三方库，完全复用 xcframework 内置版本
    ],
    targets: [
        .binaryTarget(
            name: "oneSDKBranch",
            url: "https://github.com/globaljollity/ios_sdk_test/raw/main/oneSDK.xcframework.zip",
            checksum: "6c90d72c3561abc50db26576f5f41516a061bbd90369e2e666c9350bc8caa2af"
        ),
        .target(
            name: "oneSDK",
            dependencies: [
                "oneSDKBranch" // 【仅保留这个依赖】：无其他任何第三方 .product 依赖
            ],
//            // 符号隐藏配置：确保内置第三方库符号不对外暴露
//            swiftSettings: [
//                .unsafeFlags(["-Xfrontend", "-visibility=hidden"])
//            ],
//            linkerSettings: [
//                .unsafeFlags(["-Xlinker", "-dead_strip"])
//            ]
        ),
        .testTarget(
            name: "oneSDKTests",
            dependencies: ["oneSDK"]
        ),
    ]
)
