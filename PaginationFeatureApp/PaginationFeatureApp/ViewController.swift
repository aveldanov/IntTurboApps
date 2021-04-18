//
//  ViewController.swift
//  PaginationFeatureApp
//
//  Created by Veldanov, Anton on 4/18/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private let apiCaller = APICaller()

    
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
        
    }()
    
    private var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self //assign dataSource
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        apiCaller.fetchData { [weak self] (result) in
            switch result{
            case .success(let data):
            self?.data.append(contentsOf: data)
            self?.tableView.reloadData()
            
            case .failure(_):
                break
            
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    


}

