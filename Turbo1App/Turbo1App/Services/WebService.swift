//
//  WebService.swift
//  Turbo1App
//
//  Created by Veldanov, Anton on 4/22/21.
//

import Foundation


class WebService{
    
    
    func fetchData(url:URL, completion:@escaping (Result<[Item]?,Error>)->()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data{
               let decoder = JSONDecoder()
                
                let items = try? decoder.decode([Item].self, from: data)
                
                
                completion(.success(items))
                
            }else{
                
                completion(.failure(error as! Error))
            }
            
            
            
        }.resume()
        
        
    }
    
    
}
