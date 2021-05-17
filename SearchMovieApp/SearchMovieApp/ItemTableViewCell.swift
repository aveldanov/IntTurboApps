//
//  ItemTableViewCell.swift
//  SearchMovieApp
//
//  Created by Anton Veldanov on 5/16/21.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var moviePosterView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    static let identifier = "ItemTableViewCell"
    // nib returns cell

    static func nib() -> UINib{
        return UINib(nibName: "ItemCell", bundle: nil)
    }
    
    
    func configureCell(with model: Movie){
        movieTitleLabel.text = model.Title
        movieYearLabel.text = model.Year
        let url = URL(string: model.Poster)!
        if let data = try? Data(contentsOf: url){
            self.moviePosterView.image = UIImage(data: data)
        }
        
    }
    
    
    

}
