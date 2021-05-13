//
//  WebService.swift
//  Practice5App
//
//  Created by Veldanov, Anton on 5/13/21.
//

import Foundation



class WebService{

    
    func fetchData(_ url:URL, completion:@escaping (Result<[Item]?,Error>)->()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data{
                
                let decoder = JSONDecoder()
                
                let items = try? decoder.decode([Item]?.self, from: data)
                completion(.success(items))
            }else if let error = error{
                completion(.failure(error))
            }
            
            
        }.resume()
        
        
    }
    
    
    
}
