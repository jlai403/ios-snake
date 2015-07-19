import UIKit

public struct Grid {
    
    var tileSize: CGSize
    var rows: Int
    var columns: Int
    var tiles: [[TileType]]
    
    var width: CGFloat {
        get { return self.tileSize.width * CGFloat(self.columns) }
    }
    
    var height: CGFloat {
        get { return self.tileSize.height * CGFloat(self.rows) }
    }
    
    var size: CGSize {
        get { return CGSizeMake(self.width, self.height) }
    }
    
    init(tileSize: CGSize, rows: Int, columns: Int) {
        self.tileSize = tileSize
        self.rows = rows
        self.columns = columns
        
        var columns = Array(count: self.columns, repeatedValue: TileType.Empty)
        var matrix = Array(count: self.rows, repeatedValue: columns)
        self.tiles = matrix
    }
    
    public func center() -> GridPosition {
        var x = Int(ceil(Double(self.columns / 2)))
        var y = Int(ceil(Double(self.rows / 2)))
        return GridPosition(grid: self, x: x, y: y)
    }
    
    public func position(x: Int, y: Int) -> GridPosition {
        return GridPosition(grid: self, x: x, y: y)
    }
}