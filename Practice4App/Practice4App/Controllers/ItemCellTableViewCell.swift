//
//  ItemCellTableViewCell.swift
//  Practice4App
//
//  Created by Anton Veldanov on 5/2/21.
//

import UIKit

class ItemCellTableViewCell: UITableViewCell {
    @IBOutlet weak var nameCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    func configrueCell( item: Item){
        nameCellLabel.text = item.name
    }

  

}
