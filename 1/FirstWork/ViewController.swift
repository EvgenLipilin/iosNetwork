//
//  ViewController.swift
//  FirstWork
//
//  Created by Евгений on 25.10.2020.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var imageLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://pngimg.com/uploads/github/github_PNG40.png")
        imageLogo.kf.setImage(with: url)
    }

}

