import SpriteKit

public class GameScene: SKScene {
    
    var player: Snake
    var snakeGridControl: SnakeGridControl
    
    public init(grid: Grid) {
        self.player = Snake()
        self.snakeGridControl = SnakeGridControl(grid: grid)
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
        self.snakeGridControl.initiateGame(player)
        self.present(self.player)
    }
    
    // MARK: Player
    
    private func present(player: Snake) {        
        for snakeCell in player.vector {
            self.addChild(snakeCell)
        }
    }
    
    func updateDirection(direction: CardinalDirection) {
        self.snakeGridControl.updateDirection(direction)
        
        //TODO: player should be moved by timer
        self.snakeGridControl.move(player)
    }
    
    // MARK: Food

}