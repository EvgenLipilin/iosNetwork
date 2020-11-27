//
//  File.swift
//  FirstWork
//
//  Created by Евгений on 15.11.2020.
//

import Foundation
import Kingfisher

class SecondView: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var languageTextField: UITextField!
    @IBOutlet weak var uiSegment: UISegmentedControl!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiImage.layer.cornerRadius = 60
        uiImage.clipsToBounds = true

}

    @IBAction func ToSwitch(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("+")
        case 1:
            print("-")
        default:
            break
        }
    }
    
    @IBAction func searching(_ sender: Any) {
    }
        
    }
