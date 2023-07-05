// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let package = Package(
    name: "plato",
    platforms: [.macOS(.v13)],
    products: [
        .executable(name: "plato", targets: ["plato"])
    ],
    targets: [
        .executableTarget(
            name: "plato",
            dependencies: [ "julia" ],
            cSettings: [
                .define("JULIA_DEFINE_FAST_TLS"),
                .unsafeFlags([
                    "-std=gnu11",
                    "-I", "lib/julia/include/julia",
                    "-fPIC"
                ])
            ],
            linkerSettings: [
                .unsafeFlags([
                    "-L", "lib/julia/lib",
                    "-Xlinker", "-rpath", "-Xlinker", "./lib/julia/lib",
                    "-Xlinker", "-rpath", "-Xlinker", "./lib/julia/lib/julia",
                    "-l", "julia"
                ])
            ]
        ),
        .systemLibrary(
            name: "julia",
            path: "lib/julia"
        )
    ]
)
