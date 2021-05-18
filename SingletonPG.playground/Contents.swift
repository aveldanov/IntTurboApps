import UIKit


//
//class Car{
//
//    var color = "red"
//}
//
//
//var car1 = Car()
//
//car1.color = "Blue"
//
//
//var car2 = Car()
//
//print(car2.color)


class Car{
    
    var color = "Red"
    
    static let shared = Car()
}


let myCar = Car.shared
myCar.color = "Blue"
print(myCar.color)
let car2 = Car.shared
car2.color = "Green"
print(car2.color)

let car3 = Car.shared
print(car3.color)
