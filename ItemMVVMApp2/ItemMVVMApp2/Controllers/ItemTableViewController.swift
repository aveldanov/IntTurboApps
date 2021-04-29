//
//  ItemTableViewController.swift
//  ItemMVVMApp2
//
//  Created by Anton Veldanov on 4/28/21.
//

import UIKit

class ItemTableViewController: UITableViewController {

    let url = URL(string: "https://api.github.com/users/intuit/repos")!
    var loadedItems: ItemViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        WebService().fetchData(url: url) { result in
            switch result{
            case .success(let items):
                
                self.loadedItems = ItemViewModel(items: items)
                print(self.loadedItems)
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
       
        return loadedItems == nil ? 0 : loadedItems.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return loadedItems.numberOfRowInSection(section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemTableViewCell else {
            
            fatalError("no cell")
        }

        let item = loadedItems.cellAtIndex(indexPath.row)
        cell.titleLabel.text = item.name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
