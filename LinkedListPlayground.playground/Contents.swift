

class ListNode<T>{

    
    var val: T
    var next: ListNode?
    
    init( _ val: T, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
}


struct LinkedList<T> where T: Equatable{
    
    var head: ListNode<T>?
    
    func displayList(){
        
        var current = head
        while current != nil {
            print(current?.val ?? "nil")
            current = current?.next
        }
        
    }
    
    mutating func add(_ val: T){
        
        if head == nil{
            head = ListNode(val, nil)
            return
        }
        
        var current = head
        while  current?.next != nil {
            current = current?.next
        }
        
        
        current?.next = ListNode(val,  nil)
        
    }
    
    
//    mutating func insert(_ val: T, at index: Int){
//        var curInd = 0
//        if head == nil{
//            head = ListNode(val, nil)
//        }
//        var current = head
//
//        while current != nil && curInd != index{
//            current = current?.next
//            curInd+=1
//        }
//        // 3->2->1->nil
//
//
//        current?.next = ListNode(val, current?.next)
//
//
//    }
    
    
    
//    mutating func delete(_ val: T){
//        if head?.val == val{
//            head = head?.next
//            return
//        }
//        // 3->2->1->nil
//        var current = head
//        var prev : ListNode<T>?
//        while current != nil && current?.val != val {
//            prev = current //3
//            current = current?.next // 2
//
//        }
//
//
//        prev?.next = current?.next
//
//
//    }
    
    
    
}




var list = LinkedList<Int>()

list.add(3)
list.add(2)
list.add(1)



list.displayList()

