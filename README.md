# swift-emailaddress

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

A validated email-address value type for Swift.

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-foundations/swift-emailaddress.git", branch: "main")
]
```

Add the product to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "EmailAddress", package: "swift-emailaddress")
    ]
)
```

## License

Apache 2.0. See [LICENSE](LICENSE.md).
