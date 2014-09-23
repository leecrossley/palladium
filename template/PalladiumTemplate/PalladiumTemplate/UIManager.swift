//
//  UIManager.swift
//  PalladiumTemplate
//
//  Copyright (c) 2014 Palladium. All rights reserved.
//

import UIKit

class UIManager {
    
    var window: UIWindow!
    
    init (window: UIWindow) {
        self.window = window
    }
    
    func createStoryboard() {
        var storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
        var viewController = storyboard.instantiateViewControllerWithIdentifier("Palladium") as UIViewController
        
        window.addSubview(viewController.view)
        window.rootViewController = viewController
    }
    
}