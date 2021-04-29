//
//  ItemTableViewCell.swift
//  ItemMVVMApp
//
//  Created by Anton Veldanov on 4/28/21.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var descrLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
