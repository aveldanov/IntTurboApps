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
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        thoughtsCollectionRef = db.collection(THOUGHT_REF)
    }


    
    override func viewWillAppear(_ animated: Bool) {
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
                    let timestamp = data[TIMESTAMP] ?? Date()
                    let thoughtText = data[THOUGHT_TEXT] ?? ""
                    let numLikes = data[NUM_LIKES] ?? 0
                    let numComments = data[NUM_COMMENTS] ?? 0
                    let documentID = document.documentID
                    
                }
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

