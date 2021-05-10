//
//  ThoughtTableViewCell.swift
//  ThoughtItOutApp
//
//  Created by Anton Veldanov on 5/2/21.
//

import UIKit

class ThoughtTableViewCell: UITableViewCell {

    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var thoughtTextLabel: UILabel!
    @IBOutlet weak var likesImage: UIImageView!
    @IBOutlet weak var likesNumLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(thought: Thought){
        
        usernameLabel.text = thought.username
        thoughtTextLabel.text = thought.thoughtText
        likesNumLabel.text = String(thought.numLikes)
        
        // formate date/time
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d hh:mm"
        let timestamp = formatter.string(from: thought.timestamp)
        print(thought.timestamp)
        timestampLabel.text = timestamp
    }


}
