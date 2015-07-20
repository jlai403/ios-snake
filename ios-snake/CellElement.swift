import UIKit

public struct Cell {
    var size: CGSize
    var x: Int
    var y: Int
    
    var position: CGPoint {
        get {
            var x = CGFloat(self.x) * size.width
            var y = CGFloat(self.y) * size.height
            return CGPointMake(x, y)
        }
    }
    
    init(size: CGSize, x: Int, y: Int) {
        self.size = size
        self.x = x
        self.y = y
    }
    
}