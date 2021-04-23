//
//  ItemTableViewController.swift
//  Turbo1App
//
//  Created by Veldanov, Anton on 4/22/21.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    private let url = URL(string: "https://api.github.com/users/intuit/repos")!
    private var itemsLoaded: [Item]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WebService().fetchData(url: url) { (result) in
            switch result{
            case .success(let items):
                self.itemsLoaded = items
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(_):
                break
            }
            

        }
        
        
        view.accessibilityIdentifier = "table"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsLoaded == nil ? 0 : itemsLoaded!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemTableViewCell else {
            
            fatalError("no cell")
        }
        
        if let itemsLoaded = itemsLoaded{
            cell.nameLabel.text = itemsLoaded[indexPath.row].name
        }

        cell.accessibilityIdentifier = "cell\(indexPath.row)"
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetail", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationVC = segue.destination as? DetailViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            if let itemsLoaded = itemsLoaded{
                
                destinationVC?.nameLoaded = itemsLoaded[indexPath.row].name
                
                destinationVC?.keyLoaded = itemsLoaded[indexPath.row].license?.key
                
            }
            
            
            
        }
    }
}
