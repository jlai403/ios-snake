import SpriteKit

public class SnakeGame: GridDelegate, GameSceneDelegate {
    
    var grid: Grid
    var scene: GameScene
    
    var snakeGameControl: SnakeGameControlDelegate!
    
    init(gameViewSize: CGSize, rows: Int, columns: Int) {
        self.scene = GameScene(size: gameViewSize)
        self.grid = GridGenerator.createGrid(viewSize: gameViewSize, rows: rows, columns: columns)
        self.snakeGameControl = SnakeGameControlDelegate(delegates: self)
    }
    
    public func prepareScene() {
        self.snakeGameControl.presentScene()
    }
    
    public func updateDirection(direction: CardinalDirection) {
        self.snakeGameControl.updateDirection(direction)
    }
    
    public func updatePlayerMovements() {
        self.snakeGameControl.updatePlayerMovements()
    }
    
    // MARK: Grid Delegate
    
    func center() -> Cell {
        return self.grid.center()
    }
    
    func getRandomEmptyCell() -> Cell {
        // not a very elegant solution, but will do for now...
        
        var randomRow = Int(arc4random_uniform(UInt32(self.grid.rows)))
        var randomCol = Int(arc4random_uniform(UInt32(self.grid.columns)))
        var potentialCell = grid.position(row: randomRow, col: randomCol)
        
        while (potentialCell.type != .Empty) {
            potentialCell = grid.position(row: randomRow, col: randomCol)
        }
        
        return potentialCell
    }
    
    // MARK: GameSceneDelegate
    func present(snake: Snake) {
        var unpresentedSnakeElements = snake.vector.filter { (element) in !element.presented }
        for snakeElement in unpresentedSnakeElements {
            self.present(snakeElement)
        }
    }
    
    func present(node: SnakeElement) {
        self.scene.addChild(node)
        node.presented = true
    }
    
    func present(node: PowerUpElement) {
        self.scene.addChild(node)
    }
    
}

protocol GridDelegate {
    func getRandomEmptyCell() -> Cell
    func center() -> Cell
}

protocol GameSceneDelegate {
    func present(snake: Snake)
    func present(node: SnakeElement)
    func present(node: PowerUpElement)
}