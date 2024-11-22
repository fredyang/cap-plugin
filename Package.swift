// swift-tools-version: 5.9
import PackageDescription

let package = Package(
  name: "CapPlugin",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      // the library CapPlugin use target ExamplePlugin
      name: "CapPlugin",
      targets: ["ExamplePlugin"])
  ],
  dependencies: [
    // the package name is capacitor-swift-pm
    .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main"),
    // the package name is verify-sdk-ios
    .package(url: "https://github.com/ibm-security-verify/verify-sdk-ios", branch: "main"),
    .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.10.0")),
  ],
  targets: [
    // target is configuration
    .target(
      name: "ExamplePlugin",
      // the
      dependencies: [
        .product(name: "Capacitor", package: "capacitor-swift-pm"),
        .product(name: "Cordova", package: "capacitor-swift-pm"),
        .product(name: "MFA", package: "verify-sdk-ios"),
        .product(name: "Alamofire", package: "Alamofire"),
      ],
      // the source code is in this folder
      path: "ios/Sources/ExamplePlugin"
    ),

    .testTarget(
      name: "ExamplePluginTests",
      dependencies: ["ExamplePlugin"],
      path: "ios/Tests/ExamplePluginTests"),
  ]
)
