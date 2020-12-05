//
//  VkWebView.swift
//  FirstWork
//
//  Created by Евгений on 05.12.2020.
//

import Foundation
import WebKit
import Kingfisher

class Web: UIViewController {
    
    @IBOutlet weak var web: WKWebView!
    
    var stringURL: String?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str = "document.body.style.background = \"#4e7fb5\";"
        
        let userScript = WKUserScript(source: str, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        let userContenController = WKUserContentController()
        userContenController.addUserScript(userScript)
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.userContentController = userContenController
        
        web = WKWebView(frame: .zero, configuration: webConfiguration)
        view = web
        web.reload()
        
        web.load(URLRequest(url: URL(string: stringURL!)!))
        
    }
    
}

