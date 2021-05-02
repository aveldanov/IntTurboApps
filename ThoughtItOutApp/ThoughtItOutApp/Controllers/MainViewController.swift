//
//  ViewController.swift
//  ThoughtItOutApp
//
//  Created by Anton Veldanov on 5/2/21.
//

import UIKit

enum ThoughtCategory: String{
    case serious = "serious"
    case funny = "funny"
    case crazy = "crazy"
    case popular = "popular"
}


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


     //MARK: Outlets
    
    @IBOutlet weak private var segmentControlMain: UISegmentedControl!
    @IBOutlet weak private var tableView: UITableView!
    
     //MARK: Variables
    
    private var thoughtsArr = [Thought]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thoughtsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ThoughtTableViewCell{
            
            cell.configureCell(thought: thoughtsArr[indexPath.row])
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    
    
}

