//
//  WebService.swift
//  TurboInt7
//
//  Created by Anton Veldanov on 6/24/21.
//

import Foundation


class WebService{
    
    
    func fetchData(_ url: URL, completion:@escaping (Result<[Item],Error>)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data{
                
                if let items = try? JSONDecoder().decode([Item].self, from: data){
                    completion(.success(items))
                    
                    try? UserDefaults.standard.set(PropertyListEncoder().encode(items), forKey: "array")
                }
            }else{
                var itemsUserDef: [Item]?
                
                if let data = UserDefaults.standard.value(forKey: "array") as? Data{
                    
                    if let itemsUserDef = try? PropertyListDecoder().decode([Item].self, from: data){
                        completion(.success(itemsUserDef))
                       print("BOOOOOOMM",itemsUserDef)
                    }
                }else{
                    completion(.failure(error as! Error))
                    
                }
                
            }
            
            
            
            
        }.resume()
        
        
    }
    
    
    
}
