//
//  ItemsCache.swift
//  IntTurboApp
//
//  Created by Veldanov, Anton on 4/18/21.
//

import Foundation

struct ItemsCache {
    static let key = "itemsCache"
    static func save(_ value: [Item]!) {
         UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }
    static func get() -> [Item]! {
        var userData: [Item]!
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            userData = try? PropertyListDecoder().decode([Item].self, from: data)
            return userData!
        } else {
            return userData
        }
    }
    static func remove() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
