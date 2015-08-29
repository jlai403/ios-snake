protocol SnakeGameControllerDelegate {
    func notifyGameOver(score: Int)
}

protocol SnakeGameDelegate {
    func getRandomEmptyCell() -> Cell
    func center() -> Cell
    
    func present(snake: Snake)
    func present(node: SnakeNode)
    func present(node: PowerUpNode)
    func gameOver()
    func incrementScore(increment: Int)
}