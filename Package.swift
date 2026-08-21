// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-emailaddress",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "EmailAddress",
            targets: ["EmailAddress"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-standards/swift-emailaddress-standard.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "EmailAddress",
            dependencies: [
                .product(name: "EmailAddress Standard", package: "swift-emailaddress-standard")
            ]
        ),
        .testTarget(
            name: "EmailAddress Tests",
            dependencies: [
                "EmailAddress"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
