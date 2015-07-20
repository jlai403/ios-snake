import UIKit

public class GridGenerator {

    public static let MARGIN: CGFloat = 1.0
    
    class func createGrid(#viewSize: CGSize, rows: Int, columns: Int) -> Grid {
        // should probably take view height into consideration too...one day
        var width = viewSize.width - (2 * MARGIN )
        var cellLength = floor(width / CGFloat(columns))
        var cellSize = CGSizeMake(cellLength, cellLength)
        
        return Grid(cellSize: cellSize, rows: rows, columns: columns)
    }
}