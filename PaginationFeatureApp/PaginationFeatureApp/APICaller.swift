//
//  APICaller.swift
//  PaginationFeatureApp
//
//  Created by Veldanov, Anton on 4/18/21.
//

import Foundation


class APICaller {
    
    //mocking data
    //RESULT = gives .success .failure
    func fetchData(pagination:Bool = false, completion: @escaping (Result<[String], Error>)-> Void){
        DispatchQueue.global().asyncAfter(deadline: .now()+1, execute: {
            let originalData = [
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook"
            ]
            
            let newData = [
            "Intuit",
            "Intel",
            "Ericsson"
                
            ]
            
            completion(.success(pagination ? newData : originalData))
            
        })
        
        
    }
}
