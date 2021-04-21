//
//  ItemsTableViewController.swift
//  Practice2App
//
//  Created by Veldanov, Anton on 4/19/21.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    private let url = URL(string: "https://api.github.com/users/intuit/repos")!
    
    private var itemsLoaded : [Item]?
    
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
        
        
        view.accessibilityIdentifier = Constants.table
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemTableViewCell else {
            
            fatalError("No Cell Found")
        }
        
        print(itemsLoaded)
        cell.nameLabel.text = itemsLoaded?[indexPath.row].name
        
        cell.accessibilityIdentifier = Constants.cell + "\(indexPath.row)"
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
