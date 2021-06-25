//
//  DetailedViewController.swift
//  TurboInt6
//
//  Created by Anton Veldanov on 6/22/21.
//

import UIKit

class DetailedViewController: UIViewController {

    
    @IBOutlet weak var nameDetailLabel: UILabel!
    @IBOutlet weak var keyDetailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func configureDetail(_ item:Item){
        nameDetailLabel.text = item.name
    }
    
    
    @IBAction func closeBtnClicked(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    

}
