import UIKit

public class Cell: Equatable {

    var grid: Grid
    var row: Int
    var column: Int
    var type: CellType

    
    var size: CGSize {
        get { return self.grid.cellSize }
    }
    
    var position: CGPoint {
        get {
            var x = CGFloat(self.column) * size.width
            var y = CGFloat(self.row) * size.height
            return CGPointMake(x, y)
        }
    }
    
    private init(grid: Grid, row: Int, column: Int, type: CellType) {
        self.grid = grid
        self.row = row
        self.column = column
        self.type = type
    }
    
    class func empty(#grid: Grid, row: Int, column: Int) -> Cell {
        return Cell(grid: grid, row: row, column: column, type: .Empty)
    }
    
    func north() -> Cell? {
        return self.grid.position(rowIndex: self.row+1, colIndex: self.column)
    }
    
    func south() -> Cell? {
        return self.grid.position(rowIndex: self.row-1, colIndex: self.column)
    }
    
    func east() -> Cell? {
        return self.grid.position(rowIndex: self.row, colIndex: self.column+1)
    }
    
    func west() -> Cell? {
        return self.grid.position(rowIndex: self.row, colIndex: self.column-1)
    }
}

public func ==(lhs: Cell, rhs: Cell) -> Bool {
    var rowsEqual = lhs.row == rhs.row
    var columnsEqual = lhs.column == rhs.column
    return rowsEqual && columnsEqual
}