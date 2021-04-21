//
//  WebService.swift
//  Practice2App
//
//  Created by Veldanov, Anton on 4/19/21.
//

import Foundation


class WebService{
    
    
    func fetchData(url:URL, completion:@escaping (Result<[Item]?, Error>)->() ){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data{
                
                let decoder = JSONDecoder()
                let items = try? decoder.decode([Item]?.self, from: data)
                if let items = items{
                    completion(.success(items))
                }
            }else{
                
                print(error?.localizedDescription)
                completion(.failure(error as! Error))
            }
            
            
            
        }.resume()
        
        
        
        
    }
    
    
}
