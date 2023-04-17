# FusionLocation
The FusionLocation SPM package makes it possible to use Location functionality on Android and iOS using Swift 

Discuss
-------
Join our slack channel here for Fusion Package discussion [link](https://scadeio.slack.com/archives/C025WRG18TW)

For native cross plaform development with Swift and general Fusion introduction, go here [SCADE Fusion](https://docs.scade.io/docs/fusionintroduction)

Install - Add to Package.swift
------------------------------
```swift
import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "GeoLocation",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "GeoLocation",
            type: .static,
            targets: [
                "GeoLocation"
            ]
        )
    ],
    dependencies: [
      	.package(name: "FusionLocation", url: "https://github.com/scade-platform/FusionLocation.git", .branch("main"))
    ],
    targets: [
        .target(
            name: "GeoLocation",
            dependencies: [
            	.product(name: "FusionLocation", package: "FusionLocation")
            ],
            exclude: ["main.page"],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
            ]
        )
    ]
)
```

Permission Settings
-------------------
<Add Permission specific text and instructions>

```yaml
...
ios:
  ...
  plist:
    ...
    - key: NSLocationAlwaysAndWhenInUseUsageDescription
      type: string
      value: This app just track your location to test FusionLocation      
    - key: NSLocationWhenInUseUsageDescription
      type: string
      value: This app just track your location to test FusionLocation
    ...

android:
  ...
  permissions: ["ACCESS_FINE_LOCATION"]
  ...

```
  
Demo App
--------
Our demo app is available here [link](https://github.com/scade-platform/FusionExamples/tree/main/GeoLocation)


Basic Usage
-----------
```swift
    // initialize the LocationManager
    let locationManager = LocationManager(usage: .always)
  	
    // request authorization
    locationManager.requestAuthorization()

    // start location tracking
    locationManager.startUpdatingLocation { location in
    }

    // get distance between from and to
    locationManager.distanceBetween(from: from, to: to)

    // get bearing between from and to
    locationManager.bearingBetween(from: from, to: to)

    // stop location tracking
    locationManager.stopUpdatingLocation()
```

Features
--------
List of features
* start/stop location tracking
* get distance between two locations
* get bearing between two locations

## API
---
Please find the api here [API](./Sources/FusionNFC_Common/LocationManager.swift)


## Contribution

<p>Consider contributing by creating a pull request (PR) or opening an issue. By creating an issue, you can alert the repository's maintainers to any bugs or missing documentation you've found. 🐛📝 If you're feeling confident and want to make a bigger impact, creating a PR, can be a great way to help others. 📖💡 Remember, contributing to open source is a collaborative effort, and any contribution, big or small, is always appreciated! 🙌 So why not take the first step and start contributing today? 😊</p>
