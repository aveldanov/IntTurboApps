//
//  ViewController.swift
//  SearchMovieApp
//
//  Created by Anton Veldanov on 5/16/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    var movies = [Movie]()
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }

    
    
    // Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func searchMovie(){
        
        textField.resignFirstResponder()
    }
    
    
    
    //Table
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Show movie details
        
    }

}





struct Movie {
    
}