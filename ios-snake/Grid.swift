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
    
    subscript(x: Int, y: Int) -> Cell? {
        get {
            if (outOfBounds(x, y)) {
                return nil
            } else {
                return cells[y * columns + x]!
            }
        }
        set {
            self.cells[y * self.columns + x] = newValue
        }
    }
    
    public func randomCell() -> Cell {
        var randomX = Int(arc4random_uniform(UInt32(self.columns)))
        var randomY = Int(arc4random_uniform(UInt32(self.rows)))
        return self[randomX,randomY]!
    }
    
    public func randomEmptyCell() -> Cell {
        // not a very elegant solution, but will do for now...
        var potentialCell = randomCell()
        while (potentialCell.type != .Empty) {
            potentialCell = randomCell()
        }
        
        return potentialCell
    }
    
    public func center() -> Cell {
        var row = Int(floor(Double(self.rows) / 2))
        var col = Int(floor(Double(self.columns) / 2))
        return cells[row * self.columns + col]!
    }
    
    private func outOfBounds(x: Int, _ y: Int) -> Bool {
        var invalidX = x < 0 || x >= self.columns
        var invalidY = y < 0 || y >= self.rows
        return invalidX || invalidY
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
        for (var x=0; x<self.columns; x++) {
            for (var y=0; y<self.rows; y++) {
                cells[y*columns + x] = Cell.empty(grid: self, x: x, y: y)
            }
        }
    }
}