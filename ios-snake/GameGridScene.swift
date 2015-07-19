import SpriteKit

class GameGridScene: SKScene {
    
    private var player: Snake
    private var cardinalDirection: CardinalDirection = .North
    private var grid: Grid
    
    init(grid: Grid) {
        self.player = Snake()
        self.grid = grid
        super.init(size: grid.size)
        styleGrid()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }

    private func styleGrid() {
        self.backgroundColor = Colors.colorFor(0xFEFEFE)
    }
    
    override func didMoveToView(view: SKView) {
        positionPlayer()
    }
    
    // MARK: Player
    
    private func positionPlayer() {
        var midPoint = CGPointMake(self.frame.midX, self.frame.midY)
        player.position(midPoint)
        
        for snakeNode in player.body {
            self.addChild(snakeNode)
        }
    }
    
    func updateDirection(direction: CardinalDirection) {
        if (!canUpdateDirection(direction)) {
            return
        }
        self.cardinalDirection = direction
        // TODO: moving player should be done by timer
        movePlayerOne()
    }
    
    private func canUpdateDirection(updatedDirection: CardinalDirection) -> Bool {
        switch (updatedDirection) {
        case .North:
            return self.cardinalDirection != CardinalDirection.South
        case .South:
            return self.cardinalDirection != CardinalDirection.North
        case .East:
            return self.cardinalDirection != CardinalDirection.West
        case .West:
            return self.cardinalDirection != CardinalDirection.East
        default:
            fatalError("invalid cardinal direction")
        }
    }
    
    private func movePlayerOne() {
        self.player.move(self.cardinalDirection)
    }
    
    // MARK: Food

}