//
//  SearchView.swift
//  FirstWork
//
//  Created by Евгений on 27.11.2020.
//

import Foundation
import Kingfisher

class SearchView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var countRepo: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var json: Repository?
    var repoURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "tableViewCell")
        
        countRepo.text = "Repositories found: \(json?.total_count ?? 0)"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let json = self.json else { return 0 }
        return json.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! Cell
        guard let json = self.json else { return UITableViewCell() }
        let item = json.items[indexPath.row]
        cell.configureCell(item)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = json?.items[indexPath.row].owner.html_url
        
        let newView = self.storyboard?.instantiateViewController(withIdentifier: "WebView") as! Web
        newView.stringURL = url
        self.navigationController?.pushViewController(newView, animated: true)
    }
}

