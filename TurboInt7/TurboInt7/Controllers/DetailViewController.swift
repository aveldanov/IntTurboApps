//
//  DetailViewController.swift
//  TurboInt7
//
//  Created by Anton Veldanov on 6/24/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailKeyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func configureDetail(_ item:Item){
        detailNameLabel.text = item.name
        detailKeyLabel.text = item.license?.key
    }
    
    
    @IBAction func closeClicked(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
