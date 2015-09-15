import SpriteKit

public class SnakeGame: SnakeGameDelegate {
    
    var grid: Grid
    var scene: GameScene
    
    var levelManager: LevelManager!
    var gameMechanic: GameMechanic!
    var score: Int = 0
    var isGameOver: Bool = false
    
    weak var delegate: SnakeGameControllerDelegate?
    
    init(gameViewSize: CGSize, rows: Int, columns: Int) {
        self.grid = GridGenerator.createGrid(viewSize: gameViewSize, rows: rows, columns: columns)
        self.scene = GameScene(size: gameViewSize, gridSize: grid.size)
        self.gameMechanic = GameMechanic(delegate: self)
        self.levelManager = LevelManager(target: self.gameMechanic, selector: "updatePlayerPosition")
    }
    
    deinit {
        println("deinit SnakeGame")
        self.levelManager = nil
        self.gameMechanic = nil
        self.delegate = nil
    }
    
    public func start() {
        self.scene.updateScore(self.score)
        self.scene.updateLevel(self.levelManager.currentLevel.level)
        levelManager.startTimer()
    }
    
    public func reset() {
        self.grid.clear()
        self.gameMechanic.reset()
        self.score = 0
        self.isGameOver = false
    }
   
    public func updateDirection(direction: CardinalDirection) {
        self.gameMechanic.updateDirection(direction)
    }
    
    public func currentLevel() -> Int {
        return levelManager.currentLevel.level
    }
    
    // MARK: SnakeGameControlDelegate
    
    func present(snake: Snake) {
        var unpresentedSnakeElements = snake.vector.filter { (element) in !element.presented }
        for snakeElement in unpresentedSnakeElements {
            self.present(snakeElement)
        }
    }
    
    func present(node: ISpriteKitNode) {
        self.scene.addChildNodeToGrid(node)
        node.presented = true
    }

    func incrementScore(increment: Int) {
        self.score += increment
        levelManager.levelUp(self)
        self.scene.updateScore(self.score)
        self.scene.showScoreIncrement(increment)
        self.scene.updateLevel(self.levelManager.currentLevel.level)
    }
    
    func gameOver() {
        self.isGameOver = true
        self.levelManager.reset()
        self.delegate?.notifyGameOver(self.score)
        
        ScoreboardManager.sharedInstance.log("AAA", score: self.score)
        
    }
}