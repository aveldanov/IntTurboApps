//
//  WebService.swift
//  TurboInt5App
//
//  Created by Anton Veldanov on 6/18/21.
//

import UIKit


class WebService {
    
    
    
    func fetchData(_ url: URL, completion:@escaping (Result<[Item], Error>)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{


                let decoder = JSONDecoder()
                guard let items = try? decoder.decode([Item].self, from: data) else{
                    fatalError("no items")
                }
               _ = try? UserDefaults.standard.set(PropertyListEncoder().encode(items), forKey: "array")
                completion(.success(items))
            }else{
                var itemsDef: [Item]
                 if let data = UserDefaults.standard.value(forKey: "array") as? Data {
                    itemsDef = try! PropertyListDecoder().decode([Item].self, from: data)
                     print(itemsDef)
                    completion(.success(itemsDef))
                 }
    
                completion(.failure(error as! Error))
            }
        }.resume()
        
        
        
        
    }
}



func networkCheck(){
    
    
    
}
