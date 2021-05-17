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
        searchMovie()
    }

    
    
    // Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func searchMovie(){
        
        textField.resignFirstResponder()
        
//        guard let text = textField.text, !text.isEmpty else {
//            return
//        }
        
        let url = URL(string: "https://www.omdbapi.com/?apikey=3aea79ac&s=query&type=movie")!
        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data, error == nil else{
                return
            }
            // decode
            
            var items: MovieResult?
            let decoder = JSONDecoder()

            do{
                items = try decoder.decode(MovieResult.self, from: data)
                print(items)
            }catch{
                print("error")
                
            }
            
            guard let finalItems = items else{
                return
            }
            
   

            // udpate array
            
            
            // refresh view
            
            
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
        // Show movie details
        
    }

}





struct Movie: Codable {
    private var Title: String
    private var Year: String
    private var imdbID: String
    private var _Type: String
    private var Poster: String
    
    private enum CodingKeys: String, CodingKey{
        case Title,Year,imdbID,_Type = "Type",Poster
    }
    
}

struct MovieResult: Codable {
    private var Search: [Movie]
}
