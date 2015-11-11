EZAlertController
==============
Easy Swift UIAlertController

- One line UIAlertController
- Button action with closures
- Customizable

## Usage

```swift
// Single Button Alerts
EZAlertController.alert("My Title")
EZAlertController.alert("My Title", message: "My Message")
EZAlertController.alert("My Title", message: "My Message", acceptMessage: "OK") { () -> () in
    print("cliked OK")
}

// Two Button Alerts
EZAlertController.alert("My Title", message: "My Message", cancelBlock: 
  { () -> () in
    print("clicked cancel")
    }) { () -> () in
     print("clicked accept")
}

EZAlertController.alert("My Title", message: "My Message", leftButtonMessage: "Cancel", rightButtonMessage: "Delete", leftBlock: 
  { () -> () in
    print("clicked cancel")
    }) { () -> () in
      print("clicked delete")
}

// Customize UIAlertController
let alertController = EZAlertController.alert("My Title")
alertController.buttonCornerRadius = 20.0f;
alertController.view.tintColor = self.view.tintColor;
alertController.titleFont = UIFont(name: "AvenirNext-Bold", size: 19.0)
alertController.backgroundTapDismissalGestureEnabled = true


```

![EZAlertController](/EZAlertController.gif)

###Requirements

- Swift version 2.0

## Installation

### Install Manually

- Download and drop 'EZAlertController.swift' in your project.

##Improvement
- Feel free sending pull requests.

##License
- EZAlertController is available under the MIT license. See the [LICENSE file](https://github.com/thellimist/EZAlertController/blob/master/LICENSE).

##Keywords
swift, alert, AlertView, AlertViewController, UIAlertView, UIAlertViewController
