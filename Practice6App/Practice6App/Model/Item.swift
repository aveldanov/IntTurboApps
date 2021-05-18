//
//  Item.swift
//  Practice6App
//
//  Created by Anton Veldanov on 5/17/21.
//

import Foundation


struct Item: Codable {
    public private(set) var Title: String
    public private(set) var Year: String
    public private(set) var imdbID: String
    public private(set) var _Type: String
    public private(set) var Poster: String
    
    private enum CodingKeys: String, CodingKey{
        case Title,Year,imdbID,_Type = "Type",Poster
    }
    
}

struct SearchResult: Codable {
    public private(set) var Search: [Item]
}

