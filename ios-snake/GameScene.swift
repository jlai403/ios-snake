import SpriteKit

class GameScene: SKScene {
    
    private var player: Snake
    private var moveDirection: CardinalDirection = .North
    
    
    override init() {
        self.player = Snake()
        var size = CGSizeMake(100, 100)
        super.init(size: size)
        setupEnvironment()
    }

    required init?(coder aDecoder: NSCoder) {
        self.player = Snake()
        super.init(coder: aDecoder)
        setupEnvironment()
    }

    private func setupEnvironment() {
        self.backgroundColor = Colors.whiteColor()
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
        self.moveDirection = direction
        // TODO: moving player should be done by timer
        movePlayerOne()
    }
    
    private func canUpdateDirection(updatedDirection: CardinalDirection) -> Bool {
        switch (updatedDirection) {
        case .North:
            return self.moveDirection != CardinalDirection.South
        case .South:
            return self.moveDirection != CardinalDirection.North
        case .East:
            return self.moveDirection != CardinalDirection.West
        case .West:
            return self.moveDirection != CardinalDirection.East
        default:
            fatalError("invalid cardinal direction")
        }
    }
    
    private func movePlayerOne() {
        self.player.move(self.moveDirection)
    }
    
    // MARK: Food

}