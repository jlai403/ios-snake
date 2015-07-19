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