// swift-tools-version:6.0

import CompilerPluginSupport
import PackageDescription

let package = Package(
  name: "TCAInMemoryKey",
  platforms: [
    .iOS(.v17)
  ],
  products: [
    .library(
      name: "TCAInMemoryKey",
      targets: ["TCAInMemoryKey"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.17.1")
  ],
  targets: [
    .target(
      name: "TCAInMemoryKey",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ],
      resources: []
    ),
    .testTarget(
      name: "TCAInMemoryKeyTests",
      dependencies: [
        "TCAInMemoryKey"
      ]
    ),
  ]
)
