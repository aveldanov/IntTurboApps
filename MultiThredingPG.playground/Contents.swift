import UIKit



//DispatchQueue.global().sync {
//    sleep(2)
//    print("sync: inside")
//}
//
//print("sync: outside")
//DispatchQueue.global().async {
//    sleep(2)
//    print("sync: inside")
//}
//
//print("sync: outside")


DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
    print("First delay 5 seconds")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    print("Second delay - 2 seconds")
}
