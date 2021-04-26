//
//  DetailedViewController.swift
//  Turbo2App
//
//  Created by Veldanov, Anton on 4/25/21.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var nameLoaded: String?
    var keyLoaded: String?
    
    
    @IBOutlet weak var detailedNameLabel: UILabel!
    @IBOutlet weak var detailedKeyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailedNameLabel.text = nameLoaded
        detailedKeyLabel.text = keyLoaded
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
