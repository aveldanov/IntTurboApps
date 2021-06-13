//
//  DetailedViewController.swift
//  TurboInt3
//
//  Created by Anton Veldanov on 6/12/21.
//

import UIKit

class DetailedViewController: UIViewController {
    @IBOutlet weak var detailedNameLabel: UILabel!
    @IBOutlet weak var detailedKeyLabel: UILabel!
    
    
    
    var itemDatailed: Item?

    
//    func initData(forItem item: Item){
//        self.item = item
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailedNameLabel.text = itemDatailed?.name
        detailedKeyLabel.text = itemDatailed?.license?.key
        
    }
    
    @IBAction func cancelBtnClicked(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
