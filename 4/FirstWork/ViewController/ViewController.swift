//
//  ViewController.swift
//  FirstWork
//
//  Created by Евгений on 25.10.2020.
//

import UIKit
import Kingfisher

class ViewController: UIViewController{
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var imageLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://pngimg.com/uploads/github/github_PNG40.png")
        imageLogo.kf.setImage(with: url)
    }
    
    @IBAction func transitionView(_ sender: Any) {
        
        let username = userName.text ?? ""
        let myPassword = password.text ?? ""
        

        NetworkManager.login(username: username, password: myPassword) { (statusCode, jsonData)  in
            
            guard statusCode == 200 else {
                print("Error authorization")
                return
            }
            print(jsonData)
            
            if let user = User.logFromJson(jsonData){
            DispatchQueue.main.async {
                    let newView = self.storyboard?.instantiateViewController(withIdentifier: "SecondView") as! SecondView
                    newView.user = user
                    self.navigationController?.pushViewController(newView, animated: true)
            }
                }
            }
        }
}
