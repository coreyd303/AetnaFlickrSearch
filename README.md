# Overview

This is a sample app based on the requirements provided

# Notes on Development
* **Architecture:**   This app is build using an MVVM-C architecture, and relies heavily on protocols and dependency injection

* **Testing:**   I have created a single sample test to demonstrate the power of dependency injection, however, much futher testing could be done if time allowed

# System Requirements
* Catalina
* Xcode 11 +
* Swift 5
* Carthage

# Dependencies
### This project contains dependencies compliled with Carthage
You will need to install Carthage if you don't already have in on your system. This is easiest with HomeBrew

## - Carthage
1. install Carthage via homebrew
```
$ brew install Carthage
```

2. Framework binaries should be included with the project, however should you need to compile them locally they can be added using
```
$ carthage update --no-use-binaries --platform iOS
```

# API
### I put together a lightweight API service using NODE to support this sample. You will need to also clone this project and run this server locally.
[FJSampleNodeServer](https://github.com/coreyd303/FJSampleNodeServer)

# Testing
### Tests are developed to support a high level of code confidence and can be run from Xcode via
_cmd + u_

* Mocks and stubs are found in their respective folders within the testing target. Mocks are generated using Swift Mock Gererator.
[SwiftMockGeneratorForXcode](https://github.com/seanhenry/SwiftMockGeneratorForXcode)