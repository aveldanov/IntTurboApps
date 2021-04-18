//
//  TableViewController.swift
//  IntTurboApp
//
//  Created by Veldanov, Anton on 4/18/21.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    private let url = URL(string: "https://api.github.com/users/intuit/repos")!
    
    private var itemsLoaded : [Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WebService().fetchItems(url: url) { items in
            if let items = items{
                self.itemsLoaded = items
            }else{
                print("No items loaded")
                self.itemsLoaded = [Item(name: "Error", description: nil)]
            }
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            
        }
        
        tableView.accessibilityIdentifier = "tableView"
    }
    
    
    
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemsLoaded == nil ? 1 : itemsLoaded!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemTableViewCell else{
            
            fatalError("no cell found")
        }
        
        
        cell.accessibilityIdentifier = "cell\(indexPath.row)"
        cell.nameLabel.text = itemsLoaded?[indexPath.row].name

       

        return cell
    }
    
    
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailedViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.nameLoaded = itemsLoaded![indexPath.row].name
            
        }
    }

}
