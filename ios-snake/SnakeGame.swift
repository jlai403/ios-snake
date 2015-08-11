import SpriteKit

public class SnakeGame: SnakeGameDelegate {
    
    var grid: Grid
    var scene: GameScene

    private let PLAYER_MOVE_INTERVAL: Double = 0.10
    weak private var timer: NSTimer?
    
    var snakeGameControl: SnakeGameControl!
    var score: Int = 0
    var isGameOver: Bool = false
    
    var delegate: SnakeGameControllerDelegate?
    
    init(gameViewSize: CGSize, rows: Int, columns: Int) {
        self.grid = GridGenerator.createGrid(viewSize: gameViewSize, rows: rows, columns: columns)
        self.scene = GameScene(size: grid.size)
        self.snakeGameControl = SnakeGameControl(delegate: self)
    }
    
    public func start() {
        self.updateScore()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(PLAYER_MOVE_INTERVAL, target: self.snakeGameControl, selector: Selector("updatePlayerMovements"), userInfo: nil, repeats: true)
    }
    
    public func reset() {
        self.grid.clear()
        self.snakeGameControl.resetGame()
        self.score = 0
        self.isGameOver = false
    }
    
    private func updateScore() {
        self.scene.updateScore(self.score)
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
    
    func present(snake: Snake) {
        var unpresentedSnakeElements = snake.vector.filter { (element) in !element.presented }
        for snakeElement in unpresentedSnakeElements {
            self.present(snakeElement)
        }
    }
    
    func present(node: SnakeElement) {
        self.scene.insertChild(node, atIndex: GameSceneZPositions.GAME_ELEMENT)
        node.presented = true
    }
    
    func present(node: PowerUpElement) {
        self.scene.insertChild(node, atIndex: GameSceneZPositions.GAME_ELEMENT)
    }
    
    func incrementScore(increment: Int) {
        self.score += increment
        self.updateScore()
    }
    
    func gameOver() {
        self.isGameOver = true
        self.timer?.invalidate()
        self.timer = nil
        self.delegate?.notifyGameOver(self.score)
    }
}

