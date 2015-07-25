public class SnakeMovement {
    var cardinalDirection: CardinalDirection
    
    init() {
        self.cardinalDirection = CardinalDirection.North
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
        var destination = getDestinationCell(player, direction: self.cardinalDirection)
        player.move(destination)
    }
    
    private func getDestinationCell(player: Snake, direction: CardinalDirection) -> Cell {
        var headCell = player.head.cell
        
        var destinationCell: Cell
        
        switch (direction) {
        case .North:
            destinationCell = headCell.north()
        case .South:
            destinationCell = headCell.south()
        case .East:
            destinationCell = headCell.east()
        case .West:
            destinationCell = headCell.west()
        default:
            fatalError("invalid cardinal direction")
        }
        
        return destinationCell
    }
    
}