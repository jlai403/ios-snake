protocol SnakeGameControllerDelegate {
    func notifyGameOver()
    func updateScore(score: Int)
}

protocol SnakeGameDelegate {
    func getRandomEmptyCell() -> Cell
    func center() -> Cell
    func clear()
    
    func present(snake: Snake)
    func present(node: SnakeElement)
    func present(node: PowerUpElement)
    func notifyGameOver()
    func incrementScore(increment: Int)
}