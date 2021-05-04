//
//  ViewController.swift
//  ThoughtItOutApp
//
//  Created by Anton Veldanov on 5/2/21.
//

import UIKit
import Firebase

enum ThoughtCategory: String{
    case serious = "serious"
    case funny = "funny"
    case crazy = "crazy"
    case popular = "popular"
}


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


     //MARK: Outlets
    
    @IBOutlet weak private var segmentControlMain: UISegmentedControl!
    @IBOutlet weak private var tableView: UITableView!
    
     //MARK: Variables
    
    private var thoughtsArr = [Thought]()
    private var thoughtsCollectionRef: CollectionReference!
    private var thoughtsListener: ListenerRegistration!
    private var selectedCategory = ThoughtCategory.funny.rawValue
    let db = Firestore.firestore()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableView.automaticDimension
        thoughtsCollectionRef = db.collection(THOUGHT_REF)
    }


    @IBAction func categoryChangeAction(_ sender: UISegmentedControl) {
        switch segmentControlMain.selectedSegmentIndex {
        case 0:
            selectedCategory = ThoughtCategory.funny.rawValue
        case 1:
            selectedCategory = ThoughtCategory.serious.rawValue
        case 2:
            selectedCategory = ThoughtCategory.crazy.rawValue
        default:
            selectedCategory = ThoughtCategory.popular.rawValue
        }
        
        
        thoughtsListener.remove()
        setListener() // based on new category selected
    }
    
    
    func setListener(){
        //listener for Firebase changes
        //whereField adds filtering
        thoughtsListener = thoughtsCollectionRef.whereField(CATEGORY, isEqualTo: selectedCategory).addSnapshotListener {snapshot, error in
            if let error = error{
                debugPrint("Error fetching docs\(error)")
            }else{
                self.thoughtsArr.removeAll()
                
                
                guard let snapshot = snapshot else {
                    return
                }
                for document in snapshot.documents{
                    let data = document.data()
                    let username = data[USERNAME] as? String ?? "no name"
                    let timestamp = data[TIMESTAMP] as? Date ?? Date()
                    let thoughtText = data[THOUGHT_TEXT] as? String ?? ""
                    let numLikes = data[NUM_LIKES] as? Int ?? 0
                    let numComments = data[NUM_COMMENTS] as? Int ?? 0
                    let documentID = document.documentID
                    
                    let newThought = Thought(username: username, timeStamp: timestamp, thoughtText: thoughtText, numLikes: numLikes, numComments: numComments, documentId: documentID)
                    
                    self.thoughtsArr.append(newThought)
                }
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        setListener()
   
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        thoughtsListener.remove()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(thoughtsArr)
        return thoughtsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ThoughtTableViewCell{
            
            cell.configureCell(thought: thoughtsArr[indexPath.row])
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    
    
}

