protocol SnakeGameControllerDelegate: class {
    func notifyGameOver(score: Int)
}

protocol SnakeGameDelegate: class {
    var grid: Grid { get }
    
    func present(snake: Snake)
    func present(node: ISpriteKitNode)
    func gameOver()
    func incrementScore(increment: Int)
}