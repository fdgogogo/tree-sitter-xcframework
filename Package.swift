// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "tree-sitter-xcframework",
    platforms: [.macOS(.v10_13), .iOS(.v11)],
    products: [
        .library(
            name: "TreeSitter",
            targets: ["TreeSitter", "TreeSitterResource"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/mattmassicotte/tree-sitter-yaml.git", branch: "feature/spm")
    ],
    targets: [
        .binaryTarget(
            name: "TreeSitter",
            path: "TreeSitter.xcframework"
        ),
        .target(
            name: "TreeSitterResource",
            dependencies: [
                "TreeSitter",
                .product(name: "TreeSitterYAML", package: "tree-sitter-yaml"),  // 添加 tree-sitter-yaml 作为依赖
            ],
            resources: [
                .copy("LanguageResources")
            ],
            linkerSettings: [.linkedLibrary("c++")]
        ),

    ]
)
