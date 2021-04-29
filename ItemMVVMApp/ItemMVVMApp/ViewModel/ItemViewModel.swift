//
//  ItemViewModel.swift
//  ItemMVVMApp
//
//  Created by Anton Veldanov on 4/28/21.
//

import Foundation

// parent viewmodel
struct ItemsViewModel {
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
        return ItemViewModel(item)
    }
}


extension ItemViewModel{
    
    var title: String?{
        return item.title
    }
    
    var description: String?{
        return item.description
    }
}





struct ItemViewModel{
    
    private let item: Item
    
    
}

extension ItemViewModel{
    init(_ item: Item) {
        self.item = item
    }
}
