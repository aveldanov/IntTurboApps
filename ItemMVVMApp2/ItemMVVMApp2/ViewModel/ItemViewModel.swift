//
//  ItemViewModel.swift
//  ItemMVVMApp2
//
//  Created by Anton Veldanov on 4/28/21.
//

import Foundation

struct ItemViewModel {
    public private(set) var items: [Item]?
}



extension ItemViewModel{
    
    var numberOfSections: Int{
        return 1
    }
    
    func numberOfRowInSection(_ section: Int)-> Int{
        if let items = items{
            
            return items.count

        }
        
        return 0
    }
    
    func cellAtIndex(_ index:Int) -> ItemVM{
        
        let item = items![index]
            return ItemVM(item: item)
        
        
    }
    
}


struct ItemVM{
    
    let item: Item
    
    var name: String?{
        return item.name
    }
    
}


