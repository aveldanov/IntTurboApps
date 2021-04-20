//
//  ViewController.swift
//  DependencyInjectionFeature
//
//  Created by Veldanov, Anton on 4/18/21.
//

import UIKit

class ViewController: UIViewController {

//    var someService: SomeService?
    var someService: SomeService

    init(someService: SomeService){
        self.someService = someService
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .brown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        SomeService.shared.doStuff()
        
        
        someService.doStuff()
        

    }


}

