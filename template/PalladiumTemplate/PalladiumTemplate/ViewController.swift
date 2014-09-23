//
//  ViewController.swift
//  PalladiumTemplate
//
//  Created by Lee Crossley on 23/09/2014.
//  Copyright (c) 2014 Palladium. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var webview: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences.javaScriptEnabled = true
        
        self.webview = WKWebView(frame: self.view.bounds, configuration: configuration)
        self.view = self.webview!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let index = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let request = NSURLRequest(URL: NSURL.fileURLWithPath(index!)!)
        self.webview.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

