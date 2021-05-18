//
//  ItemTableViewCell.swift
//  Practice6App
//
//  Created by Anton Veldanov on 5/17/21.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var imageViewPoster: UIImageView!
    
    
    var titleLoaded: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(with model:Item){
        titleLabel.text = model.Title
        yearLabel.text = model.Year
        let url = URL(string: model.Poster)!
        
        if let data = try? Data(contentsOf: url){
            imageViewPoster.image = UIImage(data: data)
        }
            
            
        
        
    }

}
