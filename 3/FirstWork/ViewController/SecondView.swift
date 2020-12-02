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
    
    let sort = "1&sort=stars&order=desc"
    var response = "https://api.github.com/search/repositories?q="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiImage.layer.cornerRadius = 60
        uiImage.clipsToBounds = true
        
    }
    
    @IBAction func searching(_ sender: Any) {
        
        guard let nameText = nameTextField.text else { return }
        guard let languageText = languageTextField.text else { return }
        
        if uiSegment.selectedSegmentIndex == 0 {
            NetworkManager.searchRepositoryWithoutSort(urlResponse: response, repoName: nameText, language: languageText) { [weak self] (json) in
                
                DispatchQueue.main.async {
                    let newView = self?.storyboard?.instantiateViewController(withIdentifier: "ViewThree") as! SearchView
                    newView.json = json
                    self?.navigationController?.pushViewController(newView, animated: true)
                }
            }
        } else {
            
            NetworkManager.searchRepositoryWithSort(urlResponse: response, repoName: nameText, language: languageText, sort: sort) { [weak self] (json) in
                
                DispatchQueue.main.async {
                    let newView = self?.storyboard?.instantiateViewController(withIdentifier: "ViewThree") as! SearchView
                    self?.navigationController?.pushViewController(newView, animated: true)
                }
                
            }
        }
        
    }
}
