//
//  DetailedViewController.swift
//  TurboInt4
//
//  Created by Anton Veldanov on 6/12/21.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var detailedNameLabel:UILabel!
    @IBOutlet weak var detailedKeyLabel: UILabel!
    
    
    var itemDetailed : Item?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailedNameLabel.text = itemDetailed?.name
        detailedKeyLabel.text = itemDetailed?.license?.key
    }
    
    @IBAction func closeBtnClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
