//
//  ViewController.swift
//  SearchFeature
//
//  Created by Anton Veldanov on 5/2/21.
//

import UIKit


class ResultsVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}




class ViewController: UIViewController, UISearchResultsUpdating {

    

    
    let searchController = UISearchController(searchResultsController: ResultsVC())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard  let text = searchController.searchBar.text else {
            return
        }
        
        let vc = searchController.searchResultsController as? ResultsVC
        vc?.view.backgroundColor = .yellow
        print(text)
        
    }

}

