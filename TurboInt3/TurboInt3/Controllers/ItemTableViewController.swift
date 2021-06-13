//
//  ItemTableViewController.swift
//  TurboInt3
//
//  Created by Anton Veldanov on 6/12/21.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    private let url = URL(string: "https://api.github.com/users/intuit/repos")!
    private var loadedItems : [Item]?

    override func viewDidLoad() {
        super.viewDidLoad()

        WebService().loadData(url) { result in
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
        return loadedItems == nil ? 0 : loadedItems!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemTableViewCell else {
            fatalError("No cell")
        }

        if let loadedItems = loadedItems{
            let item = loadedItems[indexPath.row]
            cell.configureCell(for: item)
        }
        


        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailedVC = storyboard?.instantiateViewController(identifier: "DetailVC") as? DetailedViewController else {
            fatalError("No Datail VC")
        }
        
        if let loadedItems = loadedItems{
            let item = loadedItems[indexPath.row]
            detailedVC.itemDatailed = item
        }
        
        present(detailedVC, animated: true, completion: nil)
        
    }
}
