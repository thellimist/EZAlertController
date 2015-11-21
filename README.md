EZAlertController
==============
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/EZAlertController.svg)](https://img.shields.io/cocoapods/v/EZAlertController.svg) [![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/thellimist/ezalertcontroller/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

Easy Swift UIAlertController

- One line setup for all UIAlertControllers
- Button action with closures instead of selectors
- Easily customizable
- Easy action sheets

## Usage

### One Button Alert

```swift
EZAlertController.alert("Title")
EZAlertController.alert("Title", message: "Message")
EZAlertController.alert("Title", message: "Message", acceptMessage: "OK") { () -> () in
    print("cliked OK")
}
```
![EZAlertController](http://i.imgur.com/OpKVypB.png)

### Multiple Button Alerts

```swift
EZAlertController.alert("Title", message: "Message", buttons: ["First", "Second"]) { (alertAction, position) -> Void in
    if position == 0 {
        print("First button clicked")
    } else if position == 1 {
        print("Second button clicked")
    }
}
```
![EZAlertController](http://i.imgur.com/Qwgg71G.png)

### Action Sheet

```swift
// With individual UIAlertAction objects
let firstButtonAction = UIAlertAction(title: "First Button", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
    print("First Button pressed")
})
let secondButtonAction = UIAlertAction(title: "Second Button", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
    print("Second Button pressed")
})

EZAlertController.actionSheet("Title", message: "message", actions: [firstButtonAction, secondButtonAction])

// With all actions in single closure
EZAlertController.actionSheet("Title", message: "Message", buttons: ["First", "Second"]) { (alertAction, position) -> Void in
    if position == 0 {
        print("First button clicked")
    } else if position == 1 {
        print("Second button clicked")
    }
}
```

![EZAlertController](http://i.imgur.com/uv32LYJ.png)

### Customizable

```swift
let alertController = EZAlertController.alert("Title") // Returns UIAlertController
alertController.setValue(attributedTitle, forKey: "attributedTitle") 
alertController.setValue(attributedMessage, forKey: "attributedMessage")
alertController.view.tintColor =  self.view.tintColor
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

pod 'EZAlertController'
```

### Install Manually

- Download and drop 'EZAlertController.swift' in your project.

##Improvement
- Feel free sending pull requests.

##License
- EZAlertController is available under the MIT license. See the [LICENSE file](https://github.com/thellimist/EZAlertController/blob/master/LICENSE).

##Keywords
swift, alert, AlertView, AlertViewController, UIAlertView, UIAlertViewController




