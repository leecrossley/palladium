//
//  Alert.swift
//  PalladiumTemplate
//
//  Created by Lee Crossley on 23/09/2014.
//  Copyright (c) 2014 Palladium. All rights reserved.
//

import UIKit

class Alert: NSObject {
    
    var message: String
    
    init (message: String?) {
        self.message = message!
    }
    
    class func alert(message: String?) -> Alert! {
        return Alert(message: message)
    }
    
    func show (ViewController: UIViewController!, animated: Bool) {
        var alert = UIAlertController(title: "Alert", message: self.message, preferredStyle: .Alert)
        
        ViewController.presentViewController(alert, animated: animated, completion: nil)
    }
}