public class SnakeGridControl {
    
    private var grid: Grid
    private var cardinalDirection: CardinalDirection = .North
    
    init(grid: Grid) {
        self.grid = grid
        self.cardinalDirection = CardinalDirection.North
    }
    
    public func initiateGame(player: Snake) {
        var cell = grid.center()
        
        for (var i=0; i<ConfigConstants.START_SNAKE_LENGTH; i++) {
            var successor: SnakeElement? = i==0 ? nil : player.vector[i-1]
            var predecessor = SnakeElement(cell: cell, successor:successor)
            player.vector.append(predecessor)
            
            cell = grid.position(row: cell.row-1, col: cell.column)
        }
    }
    
    public func updateDirection(direction: CardinalDirection) {
        if (!canUpdateDirection(direction)) {
            return
        }
        self.cardinalDirection = direction
    }
    
    private func canUpdateDirection(updatedDirection: CardinalDirection) -> Bool {
        switch (updatedDirection) {
        case .North:
            return self.cardinalDirection != CardinalDirection.South
        case .South:
            return self.cardinalDirection != CardinalDirection.North
        case .East:
            return self.cardinalDirection != CardinalDirection.West
        case .West:
            return self.cardinalDirection != CardinalDirection.East
        default:
            fatalError("invalid cardinal direction")
        }
    }
    
    public func move(player: Snake) {
        player.move(getDestinationCell(player, direction: self.cardinalDirection))
    }
    
    private func getDestinationCell(player: Snake, direction: CardinalDirection) -> Cell {
        var currentHeadCell = player.head.cell
        var currentRow = currentHeadCell.row
        var currentCol = currentHeadCell.column
        
        var destinationCell: Cell
        
        switch (direction) {
        case .North:
            destinationCell = grid.position(row: ++currentRow, col: currentCol)
        case .South:
            destinationCell = grid.position(row: --currentRow, col: currentCol)
        case .East:
            destinationCell = grid.position(row: currentRow, col: ++currentCol)
        case .West:
            destinationCell = grid.position(row: currentRow, col: --currentCol)
        default:
            fatalError("invalid cardinal direction")
        }

        return destinationCell
    }
}
