import UIKit

public class GridGenerator {

    public static let MARGIN: CGFloat = 10.0
    
    class func createGrid(#viewSize: CGSize, rows: Int, columns: Int) -> Grid {
        
        var gridWidth = viewSize.width - (2 * MARGIN )
        var tileLength = floor(gridWidth / CGFloat(columns))
        var tileSize = CGSizeMake(tileLength, tileLength)
        
        return Grid(tileSize: tileSize, rows: rows, columns: columns)
    }
}

public class Grid {

    var tileSize: CGSize
    var rows: Int
    var columns: Int
    
    var width: CGFloat {
        get { return self.tileSize.width * CGFloat(self.columns) }
    }
    
    var height: CGFloat {
        get { return self.tileSize.height * CGFloat(self.rows) }
    }

    var size: CGSize {
        get { return CGSizeMake(self.width, self.height) }
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

public enum TileType: Int {
    case Empty = 0
    case Snake = 1
    case Food = 2
}