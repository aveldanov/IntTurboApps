struct Cube{
    var sideL: Double = 1{
        willSet{
            print(sideL, newValue)
        }
        
        didSet{
            print(sideL,oldValue)
        }
    }
    
    
    
}


var cube = Cube(sideL: 3)

cube.sideL = 10

