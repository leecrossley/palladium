//
//  Palladium.swift
//  PalladiumTemplate
//
//  Copyright (c) 2014 Palladium. All rights reserved.
//

import UIKit
import WebKit

class Palladium : NSObject, WKScriptMessageHandler {
    
    var rootview: UIView
    
    init (view:UIView) {
        rootview = view
    }
    
    func initWebKitView() {
        let contentController = WKUserContentController()
        
        let src = "document.dispatchEvent(new Event('deviceready');"
        let deviceready = WKUserScript(source: src, injectionTime: .AtDocumentEnd, forMainFrameOnly: false)
        
        contentController.addUserScript(deviceready)
        contentController.addScriptMessageHandler(self, name: "callbackHandler")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        let webView = WKWebView(frame: rootview.frame, configuration: config)
        rootview.addSubview(webView)
        
        let index = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let request = NSURLRequest(URL: NSURL(fileURLWithPath: index!))
        
        webView.loadRequest(request)
    }
    
    func userContentController(userContentController: WKUserContentController!, didReceiveScriptMessage message: WKScriptMessage!) {
        println(message.body)
    }

}