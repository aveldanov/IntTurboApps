 //MARK: Struct Class Tips
 
 struct Point{
    var x = 0
    var y = 0
 }
 
 
 class Student{
    var name = "name"
    var grade = 1
 }
 
 
 var p1 = Point()
 var p2 = p1
 p2.x = 1
 p2.y = 2
 
 "(\(p1.x),\(p1.y))" // never changed
 "(\(p2.x),\(p2.y))"
 
 
 var s1 = Student()
 var s2 = s1
 
 s2.name = "Anton"
 s2.grade = 7
 
 "\(s1.name),\(s1.grade)"
 "\(s2.name),\(s2.grade)"
 
 
 
 
 //MARK: Method
 
 
 class BankAccount{
    var balance: Double = 0
    
    func deposite(amount:Double){
        balance += amount
    }
    
    func withdraw(amount:Double)->Double{
        let amount = min(amount,balance)
        balance -= amount
        return amount
    }
 }
 
 let account = BankAccount()
 
 account.deposite(amount: 100)
 account.deposite(amount: 150)
 account.withdraw(amount: 2000)
 
 account

 
 
 struct ScoreTracker{
    var score: Int = 0
    mutating func beatBoss(){
        score += 100
    }
 }

 var scoretracker = ScoreTracker()
 scoretracker.beatBoss()
 
 
 
 
 enum LightState{
    case red
    case yellow
    case green
    
    mutating func change(){
        switch self {
        case .red:
            self = .green
        case .yellow:
            self = .red
        case .green:
            self = .yellow
        }
    }
 }
 
 var light = LightState.red
 light.change()
 
 light

 
 
  //MARK: Inheritance
 
 
 
