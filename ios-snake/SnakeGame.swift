import SpriteKit

public class SnakeGame: SnakeGameDelegate {
    
    var grid: Grid
    var scene: GameScene
    
    var levelManager: LevelManager!
    var snakeMechanic: SnakeMechanic!
    var score: Int = 0
    var isGameOver: Bool = false
    
    var delegate: SnakeGameControllerDelegate?
    
    init(gameViewSize: CGSize, rows: Int, columns: Int) {
        self.grid = GridGenerator.createGrid(viewSize: gameViewSize, rows: rows, columns: columns)
        self.scene = GameScene(size: grid.size)
        self.snakeMechanic = SnakeMechanic(delegate: self)
        self.levelManager = LevelManager(target: self.snakeMechanic, selector: "updatePlayerPosition")
    }
    
    public func start() {
        self.scene.updateScore(self.score)
        levelManager.startTimer()
    }
    
    public func reset() {
        self.grid.clear()
        self.snakeMechanic.reset()
        self.score = 0
        self.isGameOver = false
    }
   
    public func updateDirection(direction: CardinalDirection) {
        self.snakeMechanic.updateDirection(direction)
    }
    
    public func currentLevel() -> Int {
        return levelManager.currentLevel.level
    }
    
    // MARK: SnakeGameControlDelegate
    func center() -> Cell {
        return self.grid.center()
    }
    
    func getRandomEmptyCell() -> Cell {
        // not a very elegant solution, but will do for now...
        
        var randomRow = Int(arc4random_uniform(UInt32(self.grid.rows)))
        var randomCol = Int(arc4random_uniform(UInt32(self.grid.columns)))
        var potentialCell = grid[randomRow, randomCol]!
        
        while (potentialCell.type != .Empty) {
            potentialCell = grid[randomRow, randomCol]!
        }
        
        return potentialCell
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
        self.scene.updateScore(self.score)
        levelManager.levelUp(self)
    }
    
    func gameOver() {
        self.isGameOver = true
        self.levelManager.stopTimer()
        self.delegate?.notifyGameOver(self.score)
    }
}