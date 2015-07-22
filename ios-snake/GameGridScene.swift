import SpriteKit

public class GameGridScene: SKScene {
    
    var player: Snake
    var snakeGameControl: SnakeGameControl
    
    public init(grid: Grid) {
        self.player = Snake()
        self.snakeGameControl = SnakeGameControl(grid: grid)
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
        self.snakeGameControl.initiateGame(player)
        self.present(self.player)
    }
    
    // MARK: Player
    
    private func present(player: Snake) {        
        for snakeCell in player.vector {
            self.addChild(snakeCell)
        }
    }
    
    func updateDirection(direction: CardinalDirection) {
        self.snakeGameControl.updateDirection(direction)
        
        //TODO: player should be moved by timer
        self.snakeGameControl.move(player)
    }
    
    // MARK: Food

}