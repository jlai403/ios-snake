protocol SnakeGameControllerDelegate {
    func notifyGameOver(score: Int)
}

protocol SnakeGameDelegate {
    func getRandomEmptyCell() -> Cell
    func center() -> Cell
    
    func present(snake: Snake)
    func present(node: SnakeElement)
    func present(node: PowerUpElement)
    func gameOver()
    func incrementScore(increment: Int)
}