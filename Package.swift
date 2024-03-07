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
    .library(name: "FluidUI", targets: ["FluidUI"]),
    .library(name: "RxFluidUI", targets: ["RxFluidUI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
  ],
  targets: [
    .target(name: "FluidUI"),
    .target(
      name: "RxFluidUI",
      dependencies: [
        "FluidUI",
        .product(name: "RxSwift", package: "RxSwift"),
        .product(name: "RxCocoa", package: "RxSwift")
      ]
    ),
    .testTarget(
      name: "FluidUITests",
      dependencies: [
        "FluidUI"
      ]
    ),
  ]
)
