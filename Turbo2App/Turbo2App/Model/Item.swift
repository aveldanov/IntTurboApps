//
//  Item.swift
//  Turbo2App
//
//  Created by Veldanov, Anton on 4/25/21.
//

import Foundation


struct Item: Codable{
    
    public private(set) var name: String?
    public private(set) var license: License?

}



struct License: Codable{
    public private(set) var key: String?
}
