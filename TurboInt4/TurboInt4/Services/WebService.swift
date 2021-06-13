//
//  WebService.swift
//  TurboInt4
//
//  Created by Anton Veldanov on 6/12/21.
//

import Foundation


class WebService{
    
    
    func fetchData(_ url:URL, completion: @escaping (Result<[Item]?, Error>)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data{
                
                let decoder = JSONDecoder()
                
                let items = try? decoder.decode([Item].self, from: data)
                
                print(items)
                completion(.success(items))
            }else{
                
                completion(.failure(error as! Error))
            }
            
            
        }.resume()
        
    }
    
}
