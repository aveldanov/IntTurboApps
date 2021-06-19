
// https://www.dropbox.com/s/66xo8f483hb9rb1/Columnar%20Layout%201.png?dl=0



struct Size {
    var width: Int
    var height: Int
}

struct Point {
    var x: Int
    var y: Int
}

public class ColumnarLayout {
    static func layoutChildViews(parentViewSize: Size, childViewSizes: [Size]) throws -> [Point] {
        
    
        
        var remHeight = parentViewSize.height
        var remWidth = parentViewSize.width
        var arr = [Point]()
        
        var x = 0
        var y = 0
        
        
        func addPoint(item: Size){
            y += item.height
            arr.append(Point(x: x, y: y))
            remHeight -= item.height
        }
        
        for i in childViewSizes{
            if remWidth > i.width{
                if remHeight > i.height{
                    addPoint(item: i)
                }else{
                    remWidth -= i.width
                    x += i.width
                    y = 0
                    remHeight = parentViewSize.height
                    addPoint(item: i)
                }
            }
        }
        return [Point]()
    }
}


let result = try ColumnarLayout.layoutChildViews(parentViewSize: Size(width: 5, height: 5), childViewSizes: [Size(width: 2, height: 2), Size(width: 2, height: 2),Size(width: 2, height: 2)])
print(result)







