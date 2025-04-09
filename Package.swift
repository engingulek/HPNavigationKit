// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HPNavigationKit",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HPNavigationKit",
            targets: ["HPNavigationKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/engingulek/HPDependencyKit", from: "1.0.0"),
        .package(url: "https://github.com/engingulek/HPModularProtocolsKit", from: "1.0.0")
        
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HPNavigationKit",
            dependencies: [
                .product(name: "DependencyKit",package: "HPDependencyKit"),
                .product(name: "HPModularProtocolsKit", package: "HPModularProtocolsKit")
            ]
        ),
        .testTarget(
            name: "HPNavigationKitTests",
            dependencies: ["HPNavigationKit"]),
    ]
)
