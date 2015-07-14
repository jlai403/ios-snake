import SpriteKit

class GameScene: SKScene {
    
    private var player: Snake
    private var moveDirection: SnakeMovementDirection = .Up
    
    
    override init(size: CGSize) {
        self.player = Snake()
        super.init(size: size)
        setupEnvironment()
    }

    required init?(coder aDecoder: NSCoder) {
        self.player = Snake()
        super.init(coder: aDecoder)
        setupEnvironment()
    }

    private func setupEnvironment() {
        self.backgroundColor = Colors.lightBlue
    }
    
    override func didMoveToView(view: SKView) {
        positionPlayer()
    }
    
    private func positionPlayer() {
        var midPoint = CGPointMake(self.frame.midX, self.frame.midY)
        player.position(midPoint)
        
        for snakeNode in player.body {
            self.addChild(snakeNode)
        }
    }
    
    func updateDirection(direction: SnakeMovementDirection) {
        self.moveDirection = direction
        movePlayerOne()
    }
    
    private func movePlayerOne() {
        self.player.move(self.moveDirection)
    }
    
}