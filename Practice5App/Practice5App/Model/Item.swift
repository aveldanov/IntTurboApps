//
//  Item.swift
//  Practice5App
//
//  Created by Veldanov, Anton on 5/13/21.
//

import Foundation



struct Item: Codable{
    
    public private(set) var name:String?
    public private(set) var license:License?

    
    
}


struct License: Codable{
    
    public private(set) var key:String?

    
    
}
