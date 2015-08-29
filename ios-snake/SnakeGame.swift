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
        self.scene = GameScene(size: gameViewSize, gridSize: grid.size)
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
        var potentialCell = grid.random()        
        while (potentialCell.type != .Empty) {
            potentialCell = grid.random()
        }
        
        return potentialCell
    }
    
    func present(snake: Snake) {
        var unpresentedSnakeElements = snake.vector.filter { (element) in !element.presented }
        for snakeElement in unpresentedSnakeElements {
            self.present(snakeElement)
        }
    }
    
    func present(node: SnakeNode) {
        self.scene.grid.addChild(node)
        node.presented = true
                var debug = self.scene.grid
    }
    
    func present(node: PowerUpNode) {
        self.scene.grid.addChild(node)
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