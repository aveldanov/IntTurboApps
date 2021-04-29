//
//  Item.swift
//  ItemMVVMApp
//
//  Created by Anton Veldanov on 4/28/21.
//

import Foundation


struct Item: Codable{
    
    public private(set) var title: String?
    public private(set) var description: String?
    
    
    
}

struct Articles: Codable {
    public private(set) var articles: [Item]?
}
