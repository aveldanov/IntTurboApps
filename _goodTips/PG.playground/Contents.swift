import Foundation
import XCTest

/*

Customer comes to the store to buy some products. He can buy apples ($3), grapes ($5) and peaches ($7). There’re also 2 types of discounts:

1) If customer buys more than 1 apple, he gets a discount of 20% for all apples;
2) If customer buys one grapes he gets another one for free.

*/



func cart(_ items: [[Any]])->Double{
  
  var price = 0.0
  let grapes = items[0][1] as! Int
  let apples = items[1][1] as! Int
  let peaches = items[2][1] as! Int
  
  if apples > 1 {
    price+=Double(apples)*3*1.2
  
  }else{
  
    price+=Double(apples)*3
  }
    
  if grapes > 1{
  
    price+=Double(grapes)*5/2
  }else{
  
    price+=Double(grapes)*5
  }
  
  price+=Double(peaches)*7
  
  return price
}
  
  


let result = cart([["grapes", 1],["apples", 0],["peaches", 1]])

print(result)









//
//
//class TestCase: XCTestCase{
//
//  static var allTests = {
//    return [("testCart", testCart)]
//    }()
//
//  func testCart(){
//    let testResult = cart([["grapes", 1],["apples", 0],["peaches", 1]])
//    print(XCTAssertEqual(testResult, 12))
//  }
//}
//
//
//XCTMain([testCase(TestCase.allTests)])
//


 //MARK: SORT


let arr = [["item1", 98, 14],["item2", 12, 12],["item3", 98, 8]]

print(arr.sorted{($0[2] as! Int)<($1[2] as! Int)}.sorted{($0[1] as! Int)>($1[1] as! Int)})



let input = [
    "item1, 98, 14",
    "item2, 12, 12",
    "items, 98, 8"
]


func sort(_ arr: [String])->[String]{
    
    
    arr.split(separator: ",")
    
    
   return []
}leetcpo
print(sort(input))









 //MARK: Items


/*
 you are given a list of sorted words as they would appear in a dictionary, but the language is 'alien' to you. Using the words, create a list that shows the order of occurrence of letters in that language's 'alphabet' sequence.
 */


let arrWord = ["sfhewrjcewc","echewicwencwe", "wdehciuec","wqduyqwpem"]


func sortArr(_ arr:[String])->[String]{
    
    
//    var joined = arr.joined()
//
//    print(joined)

    var set = Set(arr.joined()).sorted()

    print(set)
    return ["set"]
}


sortArr(arrWord)





func fitBoxes(_ box:[Int], _ items: [Int])->Int{

    
    let x = max(box[0],box[1])/max(items[0],items[1])
    let y = min(box[0],box[1])/min(items[0],items[1])

    print(x,y)
    
    
    
    
    
    return x*y
}


fitBoxes([6,5], [3,3])







