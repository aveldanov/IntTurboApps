//
//  ViewController.swift
//  TurboInt4
//
//  Created by Anton Veldanov on 6/12/21.
//

import UIKit

class ItemTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let url = URL(string: "https://api.github.com/users/intuit/repos")!
    public private(set) var loadedItems: [Item]?

    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedItems == nil ? 0 : loadedItems!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemTableViewCell else{
            fatalError("no cell")
        }
        
        if let loadedItems = loadedItems{
            let item = loadedItems[indexPath.row]
            cell.configureCell(for: item)
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(identifier: "detailVC") as? DetailedViewController else{
            fatalError("no detailed VC")
        }
        if let loadedItems = loadedItems{
            let item = loadedItems[indexPath.row]
            
            detailVC.itemDetailed = item
        }
        
        present(detailVC, animated: true, completion: nil)
        
        
    }
    

}
