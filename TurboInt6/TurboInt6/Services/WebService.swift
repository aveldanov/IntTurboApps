//
//  WebService.swift
//  TurboInt6
//
//  Created by Anton Veldanov on 6/22/21.
//

import Foundation



class WebService{
    
    
    func fetchData(_ url:URL, completion:@escaping (Result<[Item],Error>)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data, error == nil{
                
                let decoder = JSONDecoder()
                
                let items = try? decoder.decode([Item].self, from: data)
                if let items = items{
                    completion(.success(items))
                }
                
                try? UserDefaults.standard.set(PropertyListEncoder().encode(items), forKey: "array")
                
            }else{
                var itemsDefaults: [Item]
                
                if let data = UserDefaults.standard.value(forKey: "array") as? Data{
                    itemsDefaults = try! PropertyListDecoder().decode([Item].self, from: data)
                    
                    
                    completion(.success(itemsDefaults))

                }
                
                completion(.failure(error as! Error))

                
            }
            
            
            
        }.resume()
        
        
        
        
        
    }
    
    
}
