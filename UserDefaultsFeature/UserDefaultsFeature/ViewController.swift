//
//  ViewController.swift
//  UserDefaultsFeature
//
//  Created by Veldanov, Anton on 4/18/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaults.standard.set("Rob", forKey: "name")
        
         var nameObject = UserDefaults.standard.object(forKey: "name")
        if let name = nameObject as? String{
            print(name)
            
        }
        
        
        let arr = [1,2,3,4]
        
//        UserDefaults.standard.set(arr, forKey: "array")
       let arrayObject =  UserDefaults.standard.object(forKey: "array")
        
        if let array = arrayObject as? Array<Any>{
            print(array)
            
        }
        
        
    }

    

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        UserDefaults.standard.set(numberField.text, forKey: "phone")
    }
    
    

}

