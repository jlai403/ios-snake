import Foundation

public class GameMechanic: NSObject {
    
    var cardinalDirection: CardinalDirection!
    
    var player: Snake!
    var powerUp: PowerUpNode!
    
    var snakeEffects: SnakeEffects
    weak var delegate: SnakeGameDelegate!
    
    init(delegate: SnakeGameDelegate) {
        self.delegate = delegate
        self.snakeEffects = SnakeEffects()
        super.init()
        
        initializePlayer()
        initializePowerUp()
    }
    
    private func initializePlayer() {
        self.cardinalDirection = CardinalDirection.North
        self.player = Snake(startingCell: self.delegate.grid.center())
        self.snakeEffects.applyGradient(self.player)
        self.delegate.present(player)
    }
    
    private func initializePowerUp() {
        self.powerUp = PowerUpNode(cell: self.delegate.grid.randomEmptyCell())
        self.delegate.present(powerUp)
    }
    
    private func isGameOver(destination: Cell?) -> Bool {
        var outOfBounds = destination == nil
        var blocked = destination?.type == .Snake
        return outOfBounds || blocked
    }
    
    public func reset() {
        self.initializePlayer()
        self.powerUp.setPosition(self.delegate.grid.randomEmptyCell()) // power up does not get deinit, therefore not removed from parent.
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
    
    public func updatePlayerPosition() {
        self.move(player)
    }
    
    private func move(player: Snake) {
        var destination = getDestinationCell(player, direction: self.cardinalDirection)
        if (self.isGameOver(destination)) {
            self.delegate.gameOver()
        } else {
            let destination = destination!
            if (destination.type == .PowerUp) {
                self.player.consume(self.powerUp)
                self.powerUp.setPosition(self.delegate.grid.randomEmptyCell())
                
                self.snakeEffects.applyGradient(self.player)
                self.snakeEffects.blink(self.player.head)
                
                self.delegate.incrementScore(1)
            } else {
                self.player.move(destination)
            }
            self.delegate.present(player)
        }
    }
    
    private func getDestinationCell(player: Snake, direction: CardinalDirection) -> Cell? {
        var headCell = player.head.cell
        var destinationCell: Cell?
        
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