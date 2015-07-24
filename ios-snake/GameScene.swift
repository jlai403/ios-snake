import SpriteKit

public class GameScene: SKScene {
    
    var player: Snake
    var gameGridControl: GameGridControl
    
    public init(grid: Grid) {
        self.player = Snake()
        self.gameGridControl = GameGridControl(grid: grid)
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
        self.gameGridControl.initiateGame(player)
        self.present(self.player)
        self.present(self.gameGridControl.createNewPowerUp())
    }
    
    // MARK: Player
    
    private func present(player: Snake) {        
        for snakeCell in player.vector {
            self.addChild(snakeCell)
        }
    }
    
    func updateDirection(direction: CardinalDirection) {
        self.gameGridControl.updateDirection(direction)
        
        //TODO: player should be moved by timer
        self.gameGridControl.move(player)
    }
    
    // MARK: Food
    private func present(powerUp: PowerUpElement) {
        self.addChild(powerUp)
    }

}