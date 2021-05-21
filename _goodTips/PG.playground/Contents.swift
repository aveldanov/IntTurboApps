import Foundation
import XCTest
func cart(_ arr: [[Any]])->Int{

    // 1) If customer buys more than 1 apple, he gets a discount of 20% for all apples;
    // 2) If customer buys one grapes he gets another one for free.

    // price 3,5,7


    var price = 0.0



    let grapes = arr[0][1] as! Int
    let apples = arr[1][1] as! Int
    let peaches = arr[2][1] as! Int


    print(type(of: peaches))


    if apples >= 1  {
        price += Double(apples)*1.2*3
    }else{
        price += Double(apples)*3
    }

    if grapes > 1 {
        price += Double(grapes*5 / 2)
    }else{
        price += Double(grapes)*5
    }

    price += Double(peaches)*7


//    print(arr[0])

    return Int(price)
}


//[["grapes", 1],["apples", 0],["peaches", 1]]

let result = cart([["grapes", 1],["apples", 0],["peaches", 1]])
print(result)



protocol ItemProtocol{
    var pop: Int {get}
}

struct Item: ItemProtocol{
    var item: String
    var pop: Int
    var price: Int
}




func sort(_ items:[[Any]])->Int{



    var result = items.sorted{($0[1] as! Int) < ($1[1] as! Int)}
    print(result)
    return 2
}


// name, popularity, price
sort([["item1", 98, 14],["item2", 12, 12],["item3", 98, 8]])


//
//let array : [(Int, String)] = [
//    (5, "test123"),
//    (2, "test443"),
//    (3, "test663"),
//    (1, "test123")
//]
//
//let sortedArray = array.sorted { $0.0 < $1.0 }
//
//print(sortedArray)


let array = [
    ["A", -10],
    ["B", 20],
    ["C", 10],
]
print (array.sorted{($0[1] as! Int)>($1[1] as! Int)})
// [["B", 20], ["C", 10], ["A", -10]]
print (array.sorted{($0[1] as! Int)<($1 [1] as! Int)})
// [["A", -10], ["C", 10], ["B", 20]]



let arr = [["item1", 98, 14],["item2", 12, 12],["item3", 98, 8]]

print(arr.sorted{($0[2] as! Int)<($1[2] as! Int)}.sorted{($0[1] as! Int)>($1[1] as! Int)})




 //MARK: NEW

import Foundation
import XCTest



// class Manager
func cart(_ arr: [[Any]])->Int{

// 1) If customer buys more than 1 apple, he gets a discount of 20% for all apples;
// 2) If customer buys one grapes he gets another one for free.

// price 3,5,7
  
  
  var price = 0.0
  
  let grapes = arr[0][1] as! Int
  let apples = arr[1][1] as! Int
  let peaches = arr[2][1] as! Int

  if apples > 1  {
    price += Double(apples)*0.8*3
  }
  
  if grapes > 1 {
    price += Double(grapes*5 / 2)
  }else{
    price += Double(grapes*5)
  }
  
  price += Double(peaches)*7
  
  
  print(arr[0])
  
return Int(price)
}

// }

//[["grapes", 1],["apples", 0],["peaches", 1]]
// let result = Manager()

let solution = cart([["grapes", 1],["apples", 0],["peaches", 1]])
// let result = cart([["grapes", 1],["apples", 0],["peaches", 1]])
  print(solution)
  
  


class TestCase: XCTestCase{
    static var allTests = {
    return [("testCart", testCart)]
    }()
  
  
  
  // var sut: Manager!
override func setUp(){
  super.setUp()
  // sut = Manager()
  
}



func testCart(){


  let testResult = cart([["grapes", 1],["apples", 0],["peaches", 1]])
  print(XCTAssertEqual(testResult,12))
  

}
  

}
  

XCTMain([testCase(TestCase.allTests)])
