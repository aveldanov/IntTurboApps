//
//  MovieTableViewCell.swift
//  SearchMovieApp2
//
//  Created by Anton Veldanov on 6/25/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }
    
    static let identifier = "cell"
    
    static func nib()->UINib{
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }

    
    func configure(_ movie: Movie){
        print("BOOM")
        movieTitleLabel.text = movie.Title
        movieYearLabel.text = movie.Year
        let urlString = movie.Poster
        if let data = try? Data(contentsOf: URL(string: urlString)!){
            moviePosterImageView.image = UIImage(data: data)

        }
        print(movie.Title)
        
    }

    
}
