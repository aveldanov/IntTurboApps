//
//  DetailViewController.swift
//  TurboInt5App
//
//  Created by Anton Veldanov on 6/18/21.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func configureDetail(_ item: Item){
        detailName.text = item.name
        keyLabel.text = item.license?.key
    }
    


}
