// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-emailaddress",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "EmailAddress",
            targets: ["EmailAddress"]
        )
    ],
    dependencies: [
        .package(path: "../../swift-standards/swift-emailaddress-standard"),
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
