import UIKit

public class Grid {
    
    var cellSize: CGSize
    var rows: Int
    var columns: Int
    
    private var cells: [Cell?]
    
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
            return cells.count
        }
    }
    
    subscript(rowIndex: Int, colIndex: Int) -> Cell? {
        get {
            if (outOfBounds(rowIndex, colIndex)) {
                return nil
            } else {
                return cells[rowIndex * columns + colIndex]!
            }
        }
        set {
            self.cells[rowIndex * self.columns + colIndex] = newValue
        }
    }
    
    public func center() -> Cell {
        var row = Int(floor(Double(self.rows) / 2))
        var col = Int(floor(Double(self.columns) / 2))
        return cells[row * self.columns + col]!
    }
    
    private func outOfBounds(rowIndex: Int, _ colIndex: Int) -> Bool {
        var invalidRow = rowIndex < 0 || rowIndex >= self.rows
        var invalidCol = colIndex < 0 || colIndex >= self.columns
        return invalidRow || invalidCol
    }
    
    init(cellSize: CGSize, rows: Int, columns: Int) {
        self.cellSize = cellSize
        self.rows = rows
        self.columns = columns
        self.cells = [Cell?](count: self.rows * self.columns, repeatedValue: nil)
        
        initEmptyGrid()
    }
    
    func clear() {
        initEmptyGrid()
    }
    
    private func initEmptyGrid() {
        for (var row=0; row<self.rows; row++) {
            for (var col=0; col<self.columns; col++) {
                cells[row*columns + col] = Cell.empty(grid: self, row: row, column: col)
            }
        }
    }
}