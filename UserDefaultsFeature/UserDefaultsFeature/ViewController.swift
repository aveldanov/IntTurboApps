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
        
        /*
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
        
        */
        
        
        let userObject = UserDefaults.standard.object(forKey: "phone")
        if let userPhone = userObject as? String{
            
            print(userPhone)
            
            numberField.text = userPhone
        }
    }

    

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        print(numberField)
        if let numbderField = numberField{
  
            UserDefaults.standard.set(numberField.text, forKey: "phone")
            print("saved")
        }else{
            print("OOPS")
        }
     
    }
    
    

}

