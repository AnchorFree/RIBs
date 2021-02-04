// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "RIBs",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_12),
    ],
    products: [
        .library(name: "RIBs", type: .dynamic, targets: ["RIBs"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", from: "5.1.1"),
    ],
    targets: [
        .target(
            name: "RIBs",
            dependencies: ["RxSwift", "RxRelay"],
            path: "ios/RIBs"
        ),
        .testTarget(
            name: "RIBsTests",
            dependencies: ["RIBs"],
            path: "ios/RIBsTests"
        ),
    ]
)

