//
//  WebService.swift
//  Turbo2App
//
//  Created by Veldanov, Anton on 4/25/21.
//

import Foundation


class WebService{
    
    
    func fetchItems(_ url:URL, completion: (Result<[Any]?, Error>)->()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            print(data)
        }.resume()
        
        
    }
    
    
}
