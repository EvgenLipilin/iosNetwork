//
//  Mycell.swift
//  FirstWork
//
//  Created by Евгений on 27.11.2020.
//

import Foundation
import UIKit
import Kingfisher

class Cell: UITableViewCell {
    
    @IBOutlet weak var repoName: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var authorName: UILabel?
    @IBOutlet weak var avatarAuthor: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ item: Items) {
        
        repoName?.text = item.name
        descriptionLabel?.text = item.description ?? "No description"
        authorName?.text = item.owner.login
        
        let url = URL(string: item.owner.imageURL)
        avatarAuthor?.kf.setImage(with: url)
        
    }
}
