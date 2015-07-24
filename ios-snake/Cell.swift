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
    
    func below() -> Cell {
        return self.grid.position(row: self.row-1, col: self.column)
    }
}

public func ==(lhs: Cell, rhs: Cell) -> Bool {
    var rowsEqual = lhs.row == rhs.row
    var columnsEqual = lhs.column == rhs.column
    return rowsEqual && columnsEqual
}