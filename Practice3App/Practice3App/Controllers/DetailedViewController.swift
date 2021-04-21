//
//  DetailedTableViewController.swift
//  Practice3App
//
//  Created by Veldanov, Anton on 4/20/21.
//

import UIKit

class DetailedViewController:UIViewController  {

    @IBOutlet weak var nameDetLabel:UILabel!
    @IBOutlet weak var licenseKeyLabel: UILabel!
    var nameLoaded: String?
    var licenseKey: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameDetLabel.text = nameLoaded
        licenseKeyLabel.text = licenseKey
        
        view.accessibilityIdentifier = "detailedView"
    }

   

}
