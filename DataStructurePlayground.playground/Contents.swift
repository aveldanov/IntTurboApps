let arr = [1,5,6,13,16,17,22,34,56,101]



func bSearch(_ arr: [Int], num: Int)->Bool{
    
    
    var left = 0
    var right = arr.count - 1
    var mid = Int()
    
    while left <= right {
        mid = (left+right)/2
        
        if num == arr[mid]{
            return true
        }else if num < arr[mid]{
            right = mid - 1
        }else{
            left = mid + 1
        }
    }
    
    
    
    
    return false
}


bSearch(arr, num: 13)

