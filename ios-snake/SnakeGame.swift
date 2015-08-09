import SpriteKit

public class SnakeGame: SnakeGameDelegate {
    
    var grid: Grid
    var scene: GameScene
    
    var snakeGameControl: SnakeGameControl!
    var score: Int = 0
    
    var delegate: SnakeGameControllerDelegate?
    
    init(gameViewSize: CGSize, rows: Int, columns: Int) {
        self.grid = GridGenerator.createGrid(viewSize: gameViewSize, rows: rows, columns: columns)
        self.scene = GameScene(size: grid.size)
        self.snakeGameControl = SnakeGameControl(delegate: self)
    }
    
    public func prepareScene() {
        self.snakeGameControl.presentElementsForScene()
    }
    
    public func start() {
        self.snakeGameControl.startGame()
    }
    
    public func reset() {
        self.snakeGameControl.resetGame()
        self.score = 0
    }
    
    public func updateDirection(direction: CardinalDirection) {
        self.snakeGameControl.updateDirection(direction)
    }
    
    // MARK: SnakeGameControlDelegate
    func center() -> Cell {
        return self.grid.center()
    }
    
    func getRandomEmptyCell() -> Cell {
        // not a very elegant solution, but will do for now...
        
        var randomRow = Int(arc4random_uniform(UInt32(self.grid.rows)))
        var randomCol = Int(arc4random_uniform(UInt32(self.grid.columns)))
        var potentialCell = grid.position(rowIndex: randomRow, colIndex: randomCol)!
        
        while (potentialCell.type != .Empty) {
            potentialCell = grid.position(rowIndex: randomRow, colIndex: randomCol)!
        }
        
        return potentialCell
    }
    
    func clear() {
        self.grid.clear()
    }
    
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
    
    func incrementScore(increment: Int) {
        self.score += increment
    }
    
    func notifyGameOver() {
        self.delegate?.notifyGameOver()
    }
}

