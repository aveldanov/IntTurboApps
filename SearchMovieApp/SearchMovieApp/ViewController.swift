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
        searchMovie()

        return true
    }
    
    func searchMovie(){
        
        textField.resignFirstResponder()
        
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        // remove results before search
        movies.removeAll()
        //%20 - remove blanks SPACE
        let query = text.replacingOccurrences(of: " ", with: "%20")
        
        let url = URL(string: "https://www.omdbapi.com/?apikey=3aea79ac&s=\(query)&type=movie")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(data, error)

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
            
            print(finalItems.Search.first?.Title)

            // udpate array
            let newMovies = finalItems.Search
            self.movies.append(contentsOf: newMovies)
            print(self.movies.first?.Title)
            // refresh view
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
        // Show movie details
        
    }

}





struct Movie: Codable {
    public private(set) var Title: String
    public private(set) var Year: String
    public private(set) var imdbID: String
    public private(set) var _Type: String
    public private(set) var Poster: String
    
    private enum CodingKeys: String, CodingKey{
        case Title,Year,imdbID,_Type = "Type",Poster
    }
    
}

struct MovieResult: Codable {
    public private(set) var Search: [Movie]
}
