//
//  SomeService.swift
//  DependencyInjectionFeature
//
//  Created by Veldanov, Anton on 4/18/21.
//

import Foundation


class SomeService{
    
    init(){}
    
    static let shared = SomeService()
    
    func doStuff(){
        print("Did Stuff")
    }
    
}
