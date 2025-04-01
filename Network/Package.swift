import PackageDescription

let package = Package(
    name: "Network",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "Network",
            targets: ["Network"]),
    ],
    targets: [
        .target(
            name: "Network"),
    ]
)
