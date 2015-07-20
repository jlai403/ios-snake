import UIKit

public struct Grid {
    
    var cellSize: CGSize
    var rows: Int
    var columns: Int
    
    var cells: [[CellType]]
    
    var width: CGFloat {
        get { return self.cellSize.width * CGFloat(self.columns) }
    }
    
    var height: CGFloat {
        get { return self.cellSize.height * CGFloat(self.rows) }
    }
    
    var size: CGSize {
        get { return CGSizeMake(self.width, self.height) }
    }
    
    init(cellSize: CGSize, rows: Int, columns: Int) {
        self.cellSize = cellSize
        self.rows = rows
        self.columns = columns
        
        var columns = Array(count: self.columns, repeatedValue: CellType.Empty)
        var matrix = Array(count: self.rows, repeatedValue: columns)
        self.cells = matrix
    }
    
    public func center() -> Cell {
        var x = Int(floor(Double(self.columns) / 2))
        var y = Int(floor(Double(self.rows) / 2))
        return Cell(size: cellSize, x: x, y: y)
    }
    
    public func position(#x: Int, y: Int) -> Cell {
        return Cell(size: cellSize, x: x, y: y)
    }
}