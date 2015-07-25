import Foundation
import SpriteKit

public class SnakeGame {
    
    var scene: GameScene
    var grid: Grid
    
    var player: Snake
    var powerUp: PowerUpElement!
    
    private var snakeMovement: SnakeMovement
    
    init(gameViewSize: CGSize, rows: Int, columns: Int) {
        self.scene = GameScene(size: gameViewSize)
        self.grid = GridGenerator.createGrid(viewSize: gameViewSize, rows: rows, columns: columns)
        self.snakeMovement = SnakeMovement()
        self.player = Snake(startingCell: grid.center())
        self.powerUp = PowerUpElement(cell: getRandomEmptyCell())
    }
    
    public func prepareScene() {
        self.scene.present(player)
        self.scene.present(powerUp)
    }
    
    public func updateDirection(direction: CardinalDirection) {
        self.snakeMovement.updateDirection(direction)
    }
    
    public func updatePlayerMovements() {
        self.move(self.player)
    }
    
    private func move(player: Snake) {
        self.snakeMovement.move(player)
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
