//
//  ItemViewModel.swift
//  ItemMVVMApp3
//
//  Created by Anton Veldanov on 4/29/21.
//

import Foundation


struct ItemsViewModel{
    
    public private(set) var items: [Item]

    
    
}



extension ItemsViewModel{
    
    var numberOfSections:Int{
        return 1
    }
    
    func numberOfRowsInSection(_ section:Int)->Int{
        
        return items.count
    }
    
    func itemAtIndex(_ index:Int) -> ItemViewModel{
        let item = items[index]
        return ItemViewModel(item: item)
    }
}


struct ItemViewModel{
    
     let item: Item

}


extension ItemViewModel{
    
    var name: String?{
        return item.name
    }

}



extension ItemViewModel{
    init(_ item: Item) {
        self.item = item
    }
}

