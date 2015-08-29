import SpriteKit

public class GameScene: SKScene {
    
    private var grid: GridNode
    private var scoreLabel: ScoreLabelNode
    
    public init(size: CGSize, gridSize: CGSize) {
        self.grid = GridNode(size: gridSize)
        self.scoreLabel = ScoreLabelNode()
        super.init(size: size)
        self.update()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    private func update() {
        self.backgroundColor = Colors.whiteColor()
        self.positionNodes()
    }
    
    private func positionNodes() {
        self.grid.position.x = (self.frame.width - self.grid.frame.width) / 2
        self.grid.position.y = (self.frame.height - self.grid.frame.height) / 2
        
        self.scoreLabel.position.x = self.grid.position.x
        self.scoreLabel.position.y = self.grid.frame.maxY + 5.0
    }
    
    
    override public func didMoveToView(view: SKView) {
        self.renderNodes()
        self.renderBorder()
    }
    
    private func renderNodes() {
        self.addChild(self.grid)
        self.addChild(self.scoreLabel)
    }
    
    private func renderBorder() {
        var layer = CAShapeLayer()
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
        self.scoreLabel.text = "SCORE: \(score)"
    }
}