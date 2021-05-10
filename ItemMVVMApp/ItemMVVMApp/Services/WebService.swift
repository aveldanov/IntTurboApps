//
//  WebService.swift
//  ItemMVVMApp
//
//  Created by Anton Veldanov on 4/28/21.
//

import Foundation


class WebService{
    
    
    func fetchData(url:URL, completion: @escaping ([Item]?)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                
                print(data)
                let decoder = JSONDecoder()
                
                let items = try? decoder.decode(Articles.self, from: data)
                
                if let items = items{
                    
                    
                    completion(items.articles)
                }
                
            }
        }.resume()
        
        
    }
    
    
    
}
