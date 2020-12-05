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
    
    let url = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        web.load(URLRequest(url: URL(string: stringURL!)!))
        
    }
    
}

