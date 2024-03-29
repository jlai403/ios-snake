import SpriteKit

public class GameScene: SKScene {
    
    private var grid: GridNode
    private var scoreLabel: ScoreNode
    private var levelLabel: LevelNode
    
    public init(size: CGSize, gridSize: CGSize) {
        self.grid = GridNode(size: gridSize)
        self.scoreLabel = ScoreNode()
        self.levelLabel = LevelNode()
        
        super.init(size: size)
        self.update()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    deinit {
        print("deinit GameScene")
    }
    
    private func update() {
        self.backgroundColor = Colors.whiteColor()
        self.positionNodes()
    }
    
    private func positionNodes() {
        let xPos = (self.frame.width - self.grid.frame.width) / 2
        
        self.grid.position.x = xPos
        self.grid.position.y = (self.frame.height - self.grid.frame.height) / 2
        
        self.scoreLabel.position.x = xPos
        self.scoreLabel.position.y = self.grid.frame.maxY + 5.0
        
        self.levelLabel.position.x = xPos
        self.levelLabel.position.y = self.scoreLabel.frame.maxY + 5.0
    }
    
    
    override public func didMoveToView(view: SKView) {
        self.renderNodes()
        self.renderBorder()
    }
    
    private func renderNodes() {
        self.addChild(self.grid)
        self.addChild(self.scoreLabel)
        self.addChild(self.levelLabel)
    }
    
    private func renderBorder() {
        let layer = CAShapeLayer()
        layer.borderColor = Colors.colorFor(0xAEAEAE).CGColor
        layer.borderWidth = 1.0
        layer.frame = self.grid.frame
        
        self.view!.layer.addSublayer(layer)
    }

    public func addChildNodeToGrid(skNode: ISpriteKitNode) {
        if let node = skNode as? SKNode {
            self.grid.addChild(node)
        }
    }
    
    public func updateScore(score: Int) {
        self.scoreLabel.updateScore(score)
    }
    
    public func showScoreIncrement(increment: Int) {
        let incrementScoreLabel = ScoreIncrementNode(increment: increment)
        incrementScoreLabel.position = CGPointMake(self.scoreLabel.frame.maxX + 5.0, self.scoreLabel.frame.minY)
        self.addChild(incrementScoreLabel)

        let fadeOut = SKAction.fadeOutWithDuration(1.0)
        fadeOut.timingMode = SKActionTimingMode.EaseInEaseOut
        incrementScoreLabel.runAction(fadeOut) {
            incrementScoreLabel.removeFromParent()
        }
    }
    
    public func updateLevel(level: Int) {
        self.levelLabel.updateLevel(level)
    }
}