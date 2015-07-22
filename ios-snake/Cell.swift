import UIKit

public class Cell: Equatable {
    var size: CGSize
    var row: Int
    var column: Int
    var type: CellType
    
    var position: CGPoint {
        get {
            var x = CGFloat(self.column) * size.width
            var y = CGFloat(self.row) * size.height
            return CGPointMake(x, y)
        }
    }
    
    private init(size: CGSize, row: Int, column: Int, type: CellType) {
        self.size = size
        self.row = row
        self.column = column
        self.type = type
    }
    
    class func empty(#size: CGSize, row: Int, column: Int) -> Cell {
        return Cell(size: size, row: row, column: column, type: .Empty)
    }
}

public func ==(lhs: Cell, rhs: Cell) -> Bool {
    var rowsEqual = lhs.row == rhs.row
    var columnsEqual = lhs.column == rhs.column
    return rowsEqual && columnsEqual
}