//
//  Item.swift
//  TurboInt4
//
//  Created by Anton Veldanov on 6/12/21.
//

import Foundation


struct Item: Codable {
    public private(set) var name: String?
    public private(set) var license: License?
}



struct License: Codable{
    public private(set) var key: String?

}
