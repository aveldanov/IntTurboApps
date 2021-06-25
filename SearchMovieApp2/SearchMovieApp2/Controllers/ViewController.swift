//
//  ViewController.swift
//  SearchMovieApp2
//
//  Created by Anton Veldanov on 6/24/21.
//

import UIKit

//UI
//Network
// custom cell
//tap a cell

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        textField.delegate = self
        
    }
    
    
    // Field
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovie() // when Enter pressed
        return true
    }
    
    
    
    func searchMovie(){
        textField.resignFirstResponder()
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        let query = text.replacingOccurrences(of: " ", with: "%20")
        
        URLSession.shared.dataTask(with: URL(string: "https://www.omdbapi.com/?apikey=3aea79ac&s=\(query)&type=movie")!){ data, response, error in
            print(data)
            
            self.movies.removeAll()
            guard let data = data, error == nil else{
                return
            }
            
            var results: MovieResult?
            //Convert
            do{
                let decoder = JSONDecoder()
                results = try? decoder.decode(MovieResult.self, from: data)
//                print(results)

            }catch{
                print(error)
            }
            
            guard let finalMovies = results else{
                return
            }
//            //update movies
            let newMovies = finalMovies.Search
            self.movies.append(contentsOf: newMovies)
//
            print(self.movies)
//            //refresh table
            
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }
            
        }.resume()
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
    }
    

}



