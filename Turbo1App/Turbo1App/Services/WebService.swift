//
//  WebService.swift
//  Turbo1App
//
//  Created by Veldanov, Anton on 4/22/21.
//

import Foundation


class WebService{
    
    
    func fetchData(url:URL, completetion:@escaping (Result<[Any]?,Error>)->()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            print(data)
            
            
            
        }.resume()
        
        
    }
    
    
}
