import UIKit

public class Grid {
    
    var cellSize: CGSize
    var rows: Int
    var columns: Int
    
    private var cells: [[Cell?]]
    
    var width: CGFloat {
        get { return self.cellSize.width * CGFloat(self.columns) }
    }
    
    var height: CGFloat {
        get { return self.cellSize.height * CGFloat(self.rows) }
    }
    
    var size: CGSize {
        get { return CGSizeMake(self.width, self.height) }
    }
    
    var count: Int {
        get {
            var rows = cells.count
            var columns = cells[0].count
            return rows*columns
        }
    }
    
    init(cellSize: CGSize, rows: Int, columns: Int) {
        self.cellSize = cellSize
        self.rows = rows
        self.columns = columns
        
        var columns = Array<Cell?>(count: self.columns, repeatedValue: nil)
        var rows = Array(count: self.rows, repeatedValue: columns)
        self.cells = rows
        
        initDefaultGrid()
    }
    
    private func initDefaultGrid() {
        for (var row=0; row<self.rows; row++) {
            for (var col=0; col<self.columns; col++) {
                cells[row][col] = Cell.empty(grid: self, row: row, column: col)
            }
        }
    }
    public func center() -> Cell {
        var row = Int(floor(Double(self.rows) / 2))
        var col = Int(floor(Double(self.columns) / 2))
        return cells[row][col]!
    }
    
    public func position(#row: Int, col: Int) -> Cell {
        return cells[row][col]!
    }
}