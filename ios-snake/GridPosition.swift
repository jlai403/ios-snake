import UIKit

public struct GridPosition {
    var grid: Grid
    var x: Int
    var y: Int
    
    var position: CGPoint {
        get {
            var x = CGFloat(self.x) * grid.tileSize.width
            var y = CGFloat(self.y) * grid.tileSize.height
            return CGPointMake(x, y)
        }
    }
    
    init(grid:Grid, x: Int, y: Int) {
        self.grid = grid
        self.x = x
        self.y = y
    }
    
}