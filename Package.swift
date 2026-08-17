// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-emailaddress",
    platforms: [
        .macOS("27"),
        .iOS("27"),
        .tvOS("27"),
        .watchOS("27"),
        .visionOS("27")
    ],
    products: [
        .library(
            name: "EmailAddress",
            targets: ["EmailAddress"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-emailaddress-standard.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "EmailAddress",
            dependencies: [
                .product(name: "EmailAddress Standard", package: "swift-emailaddress-standard"),
            ]
        ),
        .testTarget(
            name: "EmailAddress Tests",
            dependencies: [
                "EmailAddress",
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
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
