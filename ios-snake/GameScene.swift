import SpriteKit

public class GameScene: SKScene {
    
    var snakeGame: SnakeGame
    
    public init(gameView: SKView) {
        var grid = GridGenerator.createGrid(viewSize: gameView.frame.size, rows: ConfigConstants.GAME_GRID_ROWS, columns: ConfigConstants.GAME_GRID_COLS)
        self.snakeGame = SnakeGame(grid: grid)
        super.init(size: grid.size)
        styleGrid()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }

    private func styleGrid() {
        self.backgroundColor = Colors.colorFor(0xFEFEFE)
    }
    
    override public func didMoveToView(view: SKView) {
        self.present(self.snakeGame.player)
        self.present(self.snakeGame.powerUp)
    }
    
    // MARK: Player
    
    private func present(player: Snake) {        
        for snakeCell in player.vector {
            self.addChild(snakeCell)
        }
    }
    
    func updateDirection(direction: CardinalDirection) {
        self.snakeGame.updateDirection(direction)
        
        //TODO: player should be moved by timer
        self.snakeGame.updatePlayerMovements()
    }
    
    // MARK: Food
    private func present(powerUp: PowerUpElement) {
        self.addChild(powerUp)
    }

}