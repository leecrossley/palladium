//
//  ViewController.swift
//  PalladiumTemplate
//
//  Copyright (c) 2014 Palladium. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler {
    
    var webview: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentController = WKUserContentController()
        
        let src = "document.dispatchEvent(new Event('deviceready');"
        let deviceready = WKUserScript(source: src, injectionTime: .AtDocumentEnd, forMainFrameOnly: false)
        
        contentController.addUserScript(deviceready)
        contentController.addScriptMessageHandler(self, name: "callbackHandler")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webview = WKWebView(frame: self.view.frame, configuration: config)
        self.view.addSubview(webview)
        
        let index = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let request = NSURLRequest(URL: NSURL(fileURLWithPath: index!))
        
        webview.loadRequest(request)
    }

    func userContentController(userContentController: WKUserContentController!, didReceiveScriptMessage message: WKScriptMessage!) {
        println(message.body)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

