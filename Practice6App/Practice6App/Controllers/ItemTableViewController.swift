//
//  ItemTableViewController.swift
//  Practice6App
//
//  Created by Anton Veldanov on 5/17/21.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
//    let query = text.replacingOccurrences(of: " ", with: "%20")
    
    let url = URL(string: "https://www.omdbapi.com/?apikey=3aea79ac&s=fast&type=movie")!
    var itemsLoaded: [Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        WebService().fetchData(url) { result in
            switch result{
            case .success(let items):
                self.itemsLoaded = items
                print("BOOOOOOM",self.itemsLoaded)
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemsLoaded == nil ? 1 : itemsLoaded!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemTableViewCell else{
            fatalError("no cell")
        }
        
        print(itemsLoaded)
        if let itemsLoaded = itemsLoaded{
            cell.configureCell(with: itemsLoaded[indexPath.row])
//            cell.titleLabel.text = itemsLoaded[indexPath.row].Title
        }

        return cell
    }


}
