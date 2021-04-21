//
//  DetailedViewController.swift
//  Practice2App
//
//  Created by Veldanov, Anton on 4/19/21.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var detailLabel:UILabel!
    
    
    var nameLoaded: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = nameLoaded
        view.accessibilityIdentifier = "detailedView"
    }
    

   
    
    
    
    

}
