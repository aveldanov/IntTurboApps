//
//  ItemTableViewController.swift
//  TurboInt6
//
//  Created by Anton Veldanov on 6/22/21.
//

import UIKit

class ItemTableViewController: UITableViewController {

    private let url = URL(string: "https://api.github.com/users/intuit/repos")!
    
    var loadedItems:[Item]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WebService().fetchData(url) { result in
            switch result{
            case .success(let items):
                self.loadedItems = items
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(_):
                break
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedItems == nil ? 1 : loadedItems!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemTableViewCell else{
            
            fatalError("no cell")
        }
        

        if let loadedItems = loadedItems{
            let item = loadedItems[indexPath.row]
            
            cell.configureCell(item)
            
        }
        

        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(identifier: "detailVC") as? DetailedViewController else{
            fatalError("no detailed VC")
        }
        
        present(detailVC, animated: true, completion: nil)
        
        if let loadedItems = loadedItems{
            let item = loadedItems[indexPath.row]
            detailVC.configureDetail(item)
        }
        
    }



}
