import PackageDescription

let package = Package(
    name: "inotify",
    dependencies: [
        .Package(url: "https://github.com/Ponyboy47/CSelect.git", majorVersion: 1)
    ]
)
