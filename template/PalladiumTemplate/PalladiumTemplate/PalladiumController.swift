//
//  ViewManager.swift
//  PalladiumTemplate
//
//  Copyright (c) 2014 Palladium. All rights reserved.
//

import UIKit
import WebKit

class WebKitController : NSObject, WKScriptMessageHandler {
    
    var rootview: UIView
    
    init (view:UIView) {
        rootview = view
    }
    
    func initWebKitView() {
        let contentController = WKUserContentController()
        
        let userScript = WKUserScript(source: "document.body.innerHTML = 'Hello from UserScript'; webkit.messageHandlers.callbackHandler.postMessage(\"Hello from JavaScript injected via a UserScript\");", injectionTime: .AtDocumentEnd, forMainFrameOnly: false)
        
        contentController.addUserScript(userScript)
        contentController.addScriptMessageHandler(self, name: "callbackHandler")
        
        let prefs = WKPreferences()
        prefs.javaScriptCanOpenWindowsAutomatically = true;
        
        let config = WKWebViewConfiguration()
        config.preferences = prefs
        config.userContentController = contentController
        
        let webView = WKWebView(frame: rootview.frame, configuration: config)
        rootview.addSubview(webView)
        
        let index = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let request = NSURLRequest(URL: NSURL(fileURLWithPath: index!))
        
        webView.loadRequest(request)
    }
    
    func userContentController(userContentController: WKUserContentController!, didReceiveScriptMessage message: WKScriptMessage!) {
        if (message.name == "callbackHandler") {
            println("JavaScript is sending a message \(message.body)")
        }
    }

}