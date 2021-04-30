//
//  WebServcie.swift
//  ItemMVVMApp3
//
//  Created by Anton Veldanov on 4/29/21.
//

import Foundation


class WebService {
    
    func fetchItems(url: URL, completion: @escaping (Result<[Item]?, Error>)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(data)
            if let data = data{
                let decoder = JSONDecoder()
                
                
                let items = try? decoder.decode([Item]?.self, from: data)
                
              
                
                completion(.success(items))
            }
        }.resume()
        
        
    }
    
    
}
