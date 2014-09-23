//
//  AppDelegate.swift
//  PalladiumTemplate
//
//  Copyright (c) 2014 Palladium. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        
        var manager = UIManager(window: window!)
        manager.createStoryboard()
        
        window!.makeKeyAndVisible()
        
        Palladium(view: window!).initWebKitView()
        
        return true
    }

}
