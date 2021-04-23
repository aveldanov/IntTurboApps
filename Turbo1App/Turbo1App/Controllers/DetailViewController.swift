//
//  DetailViewController.swift
//  Turbo1App
//
//  Created by Veldanov, Anton on 4/22/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detNameLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    
    var nameLoaded: String?
    var keyLoaded:String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "detail"
        // Do any additional setup after loading the view.
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
