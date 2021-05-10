//
//  WebService.swift
//  ItemMVVMApp2
//
//  Created by Anton Veldanov on 4/28/21.
//

import Foundation


class WebService{
    
    
    func fetchData(url:URL, completion: @escaping (Result<[Item]?, Error>)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data{
                
                let decoder = JSONDecoder()
                
                let items = try? decoder.decode([Item].self, from: data)
                
                completion(.success(items))
            }else{
                
                completion(.failure(Error.self as! Error))
            }
            
            
            
        }.resume()
        
    }
    
}
