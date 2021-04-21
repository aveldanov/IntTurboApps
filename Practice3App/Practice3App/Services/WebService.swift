//
//  WebService.swift
//  Practice3App
//
//  Created by Veldanov, Anton on 4/20/21.
//

import Foundation

class WebService{
    
    
    func fetchData(url:URL, completion: @escaping (Result<[Item]?,Error>)->()){
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data{
                
                let decoder = JSONDecoder()
                
                let items = try? decoder.decode([Item].self, from: data)
                
                completion(.success(items))
            }else{
                
                
                print("Error")
                
                completion(.failure(error!))
            }
            
            
            print(data)
        }.resume()
        
        
        
    }
    
    
}
