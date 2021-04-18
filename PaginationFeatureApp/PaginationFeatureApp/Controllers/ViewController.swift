//
//  ViewController.swift
//  PaginationFeatureApp
//
//  Created by Veldanov, Anton on 4/18/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UIScrollViewDelegate, UITableViewDelegate {
    
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
        tableView.delegate = self
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
        apiCaller.fetchData(pagination: false) { [weak self] (result) in
            switch result{
            case .success(let data):
            self?.data.append(contentsOf: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
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
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let position = scrollView.contentOffset.y
        
        if position > (tableView.contentSize.height - 100 - scrollView.frame.size.height){
            //fetch more data
            apiCaller.fetchData(pagination: true) { [weak self] (result) in
                switch result{
                case .success(let moreData):
                    self?.data.append(contentsOf: moreData)
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                    
                    
                case .failure(_):
                    break
                }
            }
            print("fetchMoreData")
        }
    }


}

