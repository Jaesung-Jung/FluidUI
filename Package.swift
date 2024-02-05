// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FluidUI",
  platforms: [
    .iOS(.v16),
    .macCatalyst(.v16),
    .tvOS(.v16),
    .watchOS(.v9)
  ],
  products: [
    .library(
      name: "FluidUI",
      targets: ["FluidUI"]
    ),
  ],
  targets: [
    .target(
      name: "FluidUI"
    ),
    .testTarget(
      name: "FluidUITests",
      dependencies: ["FluidUI"]
    ),
  ]
)
