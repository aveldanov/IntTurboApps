//
//  WebService.swift
//  Practice6App
//
//  Created by Anton Veldanov on 5/17/21.
//

import Foundation


struct WebService {
    
    
    
    
    func fetchData(_ url:URL, completion: @escaping (Result<[Item], Error>)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            let decoder = JSONDecoder()

            do{
                var items = try decoder.decode(SearchResult.self, from: data)
                print(items)
            }catch{
                print(error.localizedDescription)
                
            }
            
            
        }.resume()
        
    }
    
}
