import Foundation

public class SnakeGameControlDelegate {

    var gridDelegate: GridDelegate!
    var gameSceneDelegate: GameSceneDelegate!
    
    var cardinalDirection: CardinalDirection
    
    var player: Snake!
    var powerUp: PowerUpElement!
    
    init(delegates: SnakeGame) {
        self.gridDelegate = delegates
        self.gameSceneDelegate = delegates
        
        self.cardinalDirection = CardinalDirection.North

        self.player = Snake(startingCell: self.gridDelegate.center())
        self.powerUp = PowerUpElement(cell: self.gridDelegate.getRandomEmptyCell())
    }
    
    public func presentScene() {
        gameSceneDelegate.present(self.player)
        gameSceneDelegate.present(self.powerUp)
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
    
    public func updatePlayerMovements() {
        self.move(player)
    }
    
    private func move(player: Snake) {
        var destination = getDestinationCell(player, direction: self.cardinalDirection)
        if (destination.type == .PowerUp) {
            self.player.consume(self.powerUp)
            self.powerUp.setPosition(self.gridDelegate.getRandomEmptyCell())
        } else {
            self.player.move(destination)
        }
        
        self.gameSceneDelegate.present(player)
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