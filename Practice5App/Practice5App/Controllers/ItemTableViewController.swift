//
//  ItemTableViewController.swift
//  Practice5App
//
//  Created by Veldanov, Anton on 5/13/21.
//

import UIKit

class ItemTableViewController: UITableViewController {

    
    private let url = URL(string: "https://api.github.com/users/intuit/repos")!
    var loadedItems : [Item]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WebService().fetchData(url) { (result) in
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return loadedItems == nil ? 0 : loadedItems!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemTableViewCell else {
            
            fatalError("no cell")
            
        }
        
        if let loadedItems = loadedItems{
            cell.nameLabel.text = loadedItems[indexPath.row].name
        }
        
        
        

        return cell
    }


    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       performSegue(withIdentifier: "toDetailView", sender: self)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            if let loadedItems = loadedItems{
                
                destinationVC.nameLoaded = loadedItems[indexPath.row].name
                
                destinationVC.keyLoaded = loadedItems[indexPath.row].license?.key
                
                
            }
            
            
            
        }
        
    }

}
