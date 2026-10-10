// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "GeographicaKit",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "GeographicaCore", targets: ["GeographicaCore"]),
        .library(name: "GeographicaFlags", targets: ["GeographicaFlags"])
    ],
    targets: [
        .target(name: "GeographicaCore"),
        .target(
            name: "GeographicaFlags",
            dependencies: ["GeographicaCore"],
            resources: [.copy("Resources/Flags")]
        ),
        .testTarget(name: "GeographicaCoreTests", dependencies: ["GeographicaCore"]),
        .testTarget(name: "GeographicaFlagsTests", dependencies: ["GeographicaFlags", "GeographicaCore"])
    ]
)
