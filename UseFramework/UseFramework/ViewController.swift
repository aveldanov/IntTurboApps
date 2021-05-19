//
//  ViewController.swift
//  UseFramework
//
//  Created by Anton Veldanov on 5/19/21.
//

import UIKit
import FeatureFramework

class ViewController: UIViewController {

    @IBAction func openAction(_ sender: Any) {
        let manager = Manager()
        let vc = manager.viewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
