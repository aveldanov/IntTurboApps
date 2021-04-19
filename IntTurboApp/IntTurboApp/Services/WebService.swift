//
//  WebService.swift
//  IntTurboApp
//
//  Created by Veldanov, Anton on 4/18/21.
//

import Foundation


class WebService{
    
    
    
    func fetchItems(url:URL, completion: @escaping ([Item]?)->()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data{
                
                let decoder = JSONDecoder()
                let items = try? decoder.decode([Item]?.self, from: data)
                if let items = items{
                    completion(items)
                }
                
            }else{
                
                print(ItemsCache.get())

                print(error?.localizedDescription)
            }
            
            
        }.resume()
        
        
        
    }
    
    
    
}
