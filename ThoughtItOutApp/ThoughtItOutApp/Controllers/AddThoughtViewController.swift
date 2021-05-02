//
//  AddThoughtViewController.swift
//  ThoughtItOutApp
//
//  Created by Anton Veldanov on 5/2/21.
//

import UIKit
import Firebase

class AddThoughtViewController: UIViewController, UITextViewDelegate {
 //MARK: Outlets
    
    
    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var thoughtText: UITextView!
    @IBOutlet weak var postButton: UIButton!
    
     //MARK: Variables
    
    private var selectedCategory = ThoughtCategory.funny.rawValue
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postButton.layer.cornerRadius = 5
        thoughtText.layer.cornerRadius = 5
        thoughtText.text = "please add text..."
        thoughtText.textColor = .lightGray
        thoughtText.delegate = self
       
        
        
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        thoughtText.text = ""
        thoughtText.textColor  = .darkGray
    }
    
    
    

   
    @IBAction func postButtonTapped(_ sender: UIButton) {
        
        guard  let username = userNameText.text else {
            return
        }
        
        
        Firestore.firestore().collection("thoughts").addDocument(data: [
        "category" : selectedCategory,
            "numComments": 0,
            "numLikes":0,
            "thoughtText":thoughtText.text,
            "timeStamp": FieldValue.serverTimestamp(),
            "username": username
            
        ]) { error in
            if let error = error{
                debugPrint("Error adding document:\(error)")
                
            }else{
                // goes to previous controller in the stack
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        
    }
    
    
    @IBAction func categoryChanged(_ sender: UISegmentedControl) {
        
        switch categorySegment.selectedSegmentIndex {
        case 0:
            selectedCategory = ThoughtCategory.funny.rawValue
        case 1:
            selectedCategory = ThoughtCategory.serious.rawValue
        default:
            selectedCategory = ThoughtCategory.crazy.rawValue
        }
    }
    
    
}
