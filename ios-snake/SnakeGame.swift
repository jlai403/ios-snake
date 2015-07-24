import Foundation
import SpriteKit

public class SnakeGame {
    
    var scene: GameScene
    var grid: Grid
    var cardinalDirection: CardinalDirection
    
    var player: Snake
    var powerUp: PowerUpElement!
    
    init(gameViewSize: CGSize, rows: Int, columns: Int) {
        self.scene = GameScene(size: gameViewSize)
        self.grid = GridGenerator.createGrid(viewSize: gameViewSize, rows: rows, columns: columns)
        self.cardinalDirection = CardinalDirection.North
        self.player = Snake(startingCell: grid.center())
        self.powerUp = PowerUpElement(cell: getRandomEmptyCell())
    }
    
    public func prepareScene() {
        self.scene.present(player)
        self.scene.present(powerUp)
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
        self.move(self.player)
    }
    
    private func move(player: Snake) {
        var destination = getDestinationCell(player, direction: self.cardinalDirection)
        player.move(destination)
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
    
    // MARK: Power ups
    
    private func getRandomEmptyCell() -> Cell {
        // not a very elegant solution, but will do for now...
        
        var randomRow = Int(arc4random_uniform(UInt32(self.grid.rows)))
        var randomCol = Int(arc4random_uniform(UInt32(self.grid.columns)))
        var potentialCell = grid.position(row: randomRow, col: randomCol)
        
        while (potentialCell.type != .Empty) {
            potentialCell = grid.position(row: randomRow, col: randomCol)
        }
        
        return potentialCell
    }
    
}