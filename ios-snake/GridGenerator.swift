import UIKit

public class GridGenerator {

    public static let MARGIN: CGFloat = 1.0
    
    class func createGrid(viewSize viewSize: CGSize, rows: Int, columns: Int) -> Grid {
        // should probably take view height into consideration too...one day
        let width = viewSize.width - (2 * MARGIN )
        let cellLength = floor(width / CGFloat(columns))
        let cellSize = CGSizeMake(cellLength, cellLength)
        
        return Grid(cellSize: cellSize, rows: rows, columns: columns)
    }
}