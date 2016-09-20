//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//
//  EZAlertView.swift
//  EZAlertView
//
//  Created by Furkan Yilmaz on 11/11/15.
//  Copyright © 2015 Furkan Yilmaz. All rights reserved.
//

import UIKit

public class EZAlertController {
    
    //==========================================================================================================
    // MARK: - Singleton
    //==========================================================================================================
    
    class var instance : EZAlertController {
        struct Static {
            static let inst : EZAlertController = EZAlertController ()
        }
        return Static.inst
    }
    
    //==========================================================================================================
    // MARK: - Private Functions
    //==========================================================================================================
    
    private func topMostController() -> UIViewController? {
        
        var presentedVC = UIApplication.shared.keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController
        {
            presentedVC = pVC
        }
        
        if presentedVC == nil {
            print("EZAlertController Error: You don't have any views set. You may be calling in viewdidload. Try viewdidappear.")
        }
        return presentedVC
    }
    
    
    //==========================================================================================================
    // MARK: - Class Functions
    //==========================================================================================================
    
    public class func alert(title: String) -> UIAlertController {
        return alert(title: title, message: "")
    }
    
    public class func alert(title: String, message: String) -> UIAlertController {
        return alert(title: title, message: message, acceptMessage: "OK", acceptBlock: {
            // Do nothings
        })
    }
    
    public class func alert(title: String, message: String, acceptMessage: String, acceptBlock: @escaping () -> ()) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let acceptButton = UIAlertAction(title: title, style: .default) { (UIAlertAction) in
            acceptBlock()
        }
            alert.addAction(acceptButton)
            
            instance.topMostController()?.present(alert, animated: true, completion: nil)
            return alert
        }
        
        public class func alert(title: String, message: String, buttons:[String], tapBlock:((UIAlertAction,Int) -> Void)?) -> UIAlertController{
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert, buttons: buttons, tapBlock: tapBlock)
            instance.topMostController()?.present(alert, animated: true, completion: nil)
            return alert
        }
        
        public class func actionSheet(title: String, message: String, actions: [UIAlertAction]) -> UIAlertController {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.actionSheet)
            for action in actions {
                alert.addAction(action)
            }
            instance.topMostController()?.present(alert, animated: true, completion: nil)
            return alert
        }
        
        public class func actionSheet(title: String, message: String, buttons:[String], tapBlock:((UIAlertAction,Int) -> Void)?) -> UIAlertController{
            let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet, buttons: buttons, tapBlock: tapBlock)
            instance.topMostController()?.present(alert, animated: true, completion: nil)
            return alert
        }
        
        
    }
    
    private extension UIAlertController {
        convenience init(title: String?, message: String?, preferredStyle: UIAlertControllerStyle, buttons:[String], tapBlock:((UIAlertAction,Int) -> Void)?) {
            self.init(title: title, message: message, preferredStyle:preferredStyle)
            var buttonIndex = 0
            for buttonTitle in buttons {
                let action = UIAlertAction(title: buttonTitle, preferredStyle: .default, buttonIndex: buttonIndex, tapBlock: tapBlock)
                buttonIndex += 1
                self.addAction(action)
            }
        }
    }
    
    
    
    private extension UIAlertAction {
        convenience init(title: String?, preferredStyle: UIAlertActionStyle, buttonIndex:Int, tapBlock:((UIAlertAction,Int) -> Void)?) {
            self.init(title: title, style: style) {
                (action:UIAlertAction) in
                if let block = tapBlock {
                    block(action,buttonIndex)
                }
            }
        }
}

