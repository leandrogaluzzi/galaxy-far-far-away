import PackageDescription

let package = Package(
    name: "Redux",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "Redux",
            targets: ["Redux"]),
    ],
    targets: [
        .target(
            name: "Redux"),

    ]
)
