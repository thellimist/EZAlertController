//
//  EZAlertView.swift
//  EZAlertView
//
//  Created by Furkan Yilmaz on 11/11/15.
//  Copyright © 2015 Furkan Yilmaz. All rights reserved.
//

import UIKit

class EZAlertView {
    
    //==========================================================================================================
    // MARK: - Singleton
    //==========================================================================================================
    
    class var instance : EZAlertView {
        struct Static {
            static let inst : EZAlertView = EZAlertView ()
        }
        return Static.inst
    }
    
    //==========================================================================================================
    // MARK: - Init
    //==========================================================================================================
    
    init() {

    }
    
    //==========================================================================================================
    // MARK: - Private Functions
    //==========================================================================================================
    
    private func topMostController() -> UIViewController {
        var topController = (UIApplication.sharedApplication().delegate as! AppDelegate).window!.rootViewController
        
        while topController?.presentedViewController != nil {
            topController = topController?.presentedViewController
        }
        return topController!
    }
    
    
    //==========================================================================================================
    // MARK: - Class Functions
    //==========================================================================================================
    
    class func alert(title: String) -> UIAlertController {
        return alert(title, message: "")
    }
    
    class func alert(title: String, message: String) -> UIAlertController {
        return alert(title, message: message, acceptMessage: "OK") { () -> () in
            // Do nothing
        }
    }
    
    class func alert(title: String, message: String, acceptMessage: String, acceptBlock: () -> ()) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let acceptButton = UIAlertAction(title: acceptMessage, style: .Default, handler: { (action: UIAlertAction) in
            acceptBlock()
        })
        alert.addAction(acceptButton)
        
        instance.topMostController().presentViewController(alert, animated: true, completion: nil)
        return alert
    }
    
    class func alert(title: String, message: String, cancelBlock: () -> (), acceptBlock: () -> ()) -> UIAlertController {
        return alert(title, message: message, acceptMessage: "Accept", cancelMessage: "Cancel", cancelBlock: { () -> () in
            cancelBlock()
            }, acceptBlock: { () -> () in
                acceptBlock()
        })
    }
    
    class func alert(title: String, message: String, acceptMessage: String, cancelMessage: String, cancelBlock: () -> (), acceptBlock: () -> ()) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let declineButton = UIAlertAction(title: cancelMessage, style: .Default, handler: { (action: UIAlertAction) in
            cancelBlock()
        })
        let acceptButton = UIAlertAction(title: acceptMessage, style: .Default, handler: { (action: UIAlertAction) in
            acceptBlock()
        })
        alert.addAction(declineButton)
        alert.addAction(acceptButton)
        
        instance.topMostController().presentViewController(alert, animated: true, completion: nil)
        return alert
    }
    
    

}
