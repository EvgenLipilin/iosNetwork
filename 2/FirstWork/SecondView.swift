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
    var response = "https://api.github.com/?q="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiImage.layer.cornerRadius = 60
        uiImage.clipsToBounds = true
        
    }
    
    func withoutSource(urlResponse: String, repoName: String, language: String, completion: @escaping (_ response: URLResponse, _ data: Data) -> ()) {
        let urlForSearch = urlResponse + repoName + "+language:" + language
        guard let url = URL(string: urlForSearch) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard let response = response, let data = data else { return }
            completion(response, data)
        }.resume()
    }
    
    func withSource(urlResponse: String, repoName: String, language: String, sort: String, completion: @escaping (_ response: URLResponse, _ data: Data) -> ()) {
        let urlForSearch = urlResponse + repoName + "+language:" + language + sort
        guard let url = URL(string: urlForSearch) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard let response = response, let data = data else { return }
            completion(response, data)
        }.resume()
    }
    
    
    @IBAction func searching(_ sender: Any) {
        
        guard let repoText = nameTextField.text else { return }
        guard let languageText = languageTextField.text else { return }
        
        if uiSegment.selectedSegmentIndex == 0 {
            withoutSource(urlResponse: response, repoName: repoText, language: languageText) { (response, data) in
                print(response)
                print(data)
            }
            
        } else {
            withSource(urlResponse: response, repoName: repoText, language: languageText, sort: sort) { (response, data) in
                print(response)
                print(data)
            }
        }
    }
}

