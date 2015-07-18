import UIKit

class GridGenerator {
    
    private static let widthMarginsPercent: CGFloat = 0.1
    
    class func createGrid(#viewSize: CGSize, rows: Int, columns: Int) -> Grid {
        
        var gridWidth = viewSize.width * (1.0 - 2 * widthMarginsPercent)
        var tileLength = floor(gridWidth / CGFloat(columns))
        var tileSize = CGSizeMake(tileLength, tileLength)
        
        return Grid(tileSize: tileSize, rows: rows, columns: columns)
    }
}

class Grid {

    var tileSize: CGSize
    var rows: Int
    var columns: Int
    
    var width: CGFloat {
        get { return self.tileSize.width * CGFloat(self.columns) }
    }
    
    var height: CGFloat {
        get { return self.tileSize.height * CGFloat(self.rows) }
    }

    var tiles: [[TileType]]
    
    init(tileSize: CGSize, rows: Int, columns: Int) {
        self.tileSize = tileSize
        self.rows = rows
        self.columns = columns

        var columnMatrix = Array(count: Int(self.columns), repeatedValue: TileType.Empty)
        var matrix = Array(count: Int(self.rows), repeatedValue: columnMatrix)
        self.tiles = matrix
    }
}

enum TileType: Int {
    case Empty = 0
    case Snake = 1
    case Food = 2
}