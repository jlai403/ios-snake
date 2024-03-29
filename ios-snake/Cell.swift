import UIKit

public class Cell: Equatable {

    private var grid: Grid
    var x: Int
    var y: Int
    var type: CellType

    var size: CGSize {
        get {
            return self.grid.cellSize
        }
    }
    
    var position: CGPoint {
        get {
            let x = CGFloat(self.x) * size.width
            let y = CGFloat(self.y) * size.height
            return CGPointMake(x, y)
        }
    }
    
    private init(grid: Grid, x: Int, y: Int, type: CellType) {
        self.grid = grid
        self.x = x
        self.y = y
        self.type = type
    }
    
    class func empty(grid grid: Grid, x: Int, y: Int) -> Cell {
        return Cell(grid: grid, x: x, y: y, type: .Empty)
    }
    
    func north() -> Cell? {
        return self.grid[self.x, self.y+1]
    }
    
    func south() -> Cell? {
        return self.grid[self.x, self.y-1]
    }
    
    func east() -> Cell? {
        return self.grid[self.x+1, self.y]
    }
    
    func west() -> Cell? {
        return self.grid[self.x-1, self.y]
    }
}

public func ==(lhs: Cell, rhs: Cell) -> Bool {
    let equalX = lhs.x == rhs.x
    let equalY = lhs.y == rhs.y
    return equalX && equalY
}