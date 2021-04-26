//
//  WebService.swift
//  Turbo2App
//
//  Created by Veldanov, Anton on 4/25/21.
//

import Foundation


class WebService{
    
    
    func fetchItems(_ url:URL, completion:@escaping (Result<[Item]?, Error>)->()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data{
                
                let decoder = JSONDecoder()
                
                let items = try? decoder.decode([Item].self, from: data)
                
                completion(.success(items))
                
            }
            
        }.resume()
        
        
    }
    
    
}
