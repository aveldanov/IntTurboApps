//
//  ItemTableViewCell.swift
//  TurboInt5App
//
//  Created by Anton Veldanov on 6/18/21.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func configureCell(_ item: Item){
        nameLabel.text = item.name
    }


}
