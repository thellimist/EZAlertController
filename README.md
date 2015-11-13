EZAlertController
==============
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/EZAlertController.svg)](https://img.shields.io/cocoapods/v/EZAlertController.svg)

Easy Swift UIAlertController

- One line UIAlertController
- Button action with closures
- Customizable

## Usage

### One Button Alert

```swift
EZAlertController.alert("Title")
EZAlertController.alert("Title", message: "Message")
EZAlertController.alert("Title", message: "Message", acceptMessage: "OK") { () -> () in
    print("cliked OK")
}
```
![EZAlertController](http://i.imgur.com/A2M444x.png)

### Two Button Alerts

```swift
EZAlertController.alert("Title", message: "Message", cancelBlock: 
  { () -> () in
    print("clicked cancel")
    }) { () -> () in
     print("clicked accept")
}

EZAlertController.alert("Title", message: "Message", leftButtonMessage: "Cancel", rightButtonMessage: "Accept", leftBlock: 
  { () -> () in
    print("clicked cancel")
    }) { () -> () in
      print("clicked accept")
}
```
![EZAlertController](http://i.imgur.com/Qwgg71G.png)

### Customizable

```swift
let alertController = EZAlertController.alert("My Title") // Returns UIAlertController
alertController.buttonCornerRadius = 20.0f;
alertController.view.tintColor = self.view.tintColor;
alertController.titleFont = UIFont(name: "AvenirNext-Bold", size: 19.0)
alertController.backgroundTapDismissalGestureEnabled = true
...
```

###Requirements

- Swift version 2.0

## Installation

### Install via CocoaPods

You can use [Cocoapods](http://cocoapods.org/) to install `EZAlertController` by adding it to your `Podfile`:
```ruby
platform :ios, '8.0'
use_frameworks!

pod  'EZAlertController'
```

### Install Manually

- Download and drop 'EZAlertController.swift' in your project.

##Improvement
- Feel free sending pull requests.

##License
- EZAlertController is available under the MIT license. See the [LICENSE file](https://github.com/thellimist/EZAlertController/blob/master/LICENSE).

##Keywords
swift, alert, AlertView, AlertViewController, UIAlertView, UIAlertViewController
