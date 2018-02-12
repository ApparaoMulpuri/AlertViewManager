# AlertViewManager

[![Version](https://img.shields.io/cocoapods/v/Tags.svg?style=flat)](http://cocoapods.org/pods/Tags)
[![License](https://img.shields.io/cocoapods/l/Tags.svg?style=flat)](http://cocoapods.org/pods/Tags)
[![Platform](https://img.shields.io/cocoapods/p/Tags.svg?style=flat)](http://cocoapods.org/pods/Tags)
[![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift/)

## Introduce
AlertViewManager is a singleton class for dispalying the UIAlerts in the applicaiton. Also, this class solves the multiple alert displays same time in the application. 


## Requirements

`AlertViewManager` written in Swift 4. Compatible with iOS 8.0+

## Installation

### Cocoapods

AlertViewManager is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'AlertViewManager'
```

#### Example Usage: 
     AlertViewManager.sharedManager.showOkAlert("Title", message: "Custom Mesasge for the title", handler: nil)
     
     
#### Screenshot:

![alt text](https://github.com/ApparaoMulpuri/AlertViewManager/blob/master/Screenshots/Screen%20Shot%202017-12-11%20at%204.00.42%20PM.png)
