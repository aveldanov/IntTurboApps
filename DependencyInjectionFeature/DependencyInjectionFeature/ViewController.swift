//
//  ViewController.swift
//  DependencyInjectionFeature
//
//  Created by Veldanov, Anton on 4/18/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SomeService.shared.doStuff()

    }


}

