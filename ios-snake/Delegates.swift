protocol SnakeGameDelegate {
    func notifyGameOver()
}

protocol SnakeGameControlDelegate {
    func getRandomEmptyCell() -> Cell
    func center() -> Cell
    func clear()
    
    func present(snake: Snake)
    func present(node: SnakeElement)
    func present(node: PowerUpElement)
    func notifyGameOver()
}