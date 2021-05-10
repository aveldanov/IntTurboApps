//
//  WebService.swift
//  Practice4App
//
//  Created by Anton Veldanov on 5/2/21.
//

import Foundation


class WebService{
    
    
    func fetchData(url:URL, completion: @escaping (Result<[Item]?,Error>)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
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
