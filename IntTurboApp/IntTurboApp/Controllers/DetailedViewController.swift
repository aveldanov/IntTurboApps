//
//  DetailedViewController.swift
//  IntTurboApp
//
//  Created by Veldanov, Anton on 4/18/21.
//

import UIKit

class DetailedViewController: UIViewController {

    var nameLoaded: String?
    var descriptionLoaded: String?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = nameLoaded
        view.accessibilityIdentifier = "detailedView"
    }
    


}
