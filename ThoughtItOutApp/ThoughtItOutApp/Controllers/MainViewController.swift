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
    let db = Firestore.firestore()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        thoughtsCollectionRef = db.collection(THOUGHT_REF)
    }


    
    override func viewWillAppear(_ animated: Bool) {
        //listener for Firebase changes
        thoughtsCollectionRef.addSnapshotListener {snapshot, error in
            if let error = error{
                debugPrint("Error fetching docs\(error)")
            }else{
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
        
        
        thoughtsCollectionRef.getDocuments { snapshot, error in
            if let error = error{
                debugPrint("Error fetching docs\(error)")
            }else{
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

