//
//  ItemTableViewCell.swift
//  TurboInt4
//
//  Created by Anton Veldanov on 6/12/21.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func configureCell(for item: Item){
      
        nameLabel.text = item.name
        
    }

}
