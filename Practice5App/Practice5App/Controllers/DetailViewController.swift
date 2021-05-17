//
//  DetailViewController.swift
//  Practice5App
//
//  Created by Veldanov, Anton on 5/13/21.
//

import UIKit

class DetailViewController: UIViewController {

    var nameLoaded: String?
    var keyLoaded: String?
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailKeyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailNameLabel.text = nameLoaded
        
        detailKeyLabel.text = keyLoaded
        // Do any additional setup after loading the view.
    }
    


}
