import SpriteKit

public class GameScene: SKScene {
    
    var grid: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    
    public init(size: CGSize, gridSize: CGSize) {
        super.init(size: size)
        setupScene(gridSize)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    private func setupScene(gridSize: CGSize) {
        setupGrid(gridSize)
        setupScoreLabel()
    }
    
    private func setupGrid(size: CGSize) {
        self.grid = SKSpriteNode(color: Colors.colorFor(0xFEFEFE), size: size)
        self.grid.anchorPoint = CGPointZero
        self.addChild(self.grid)
    }
    
    private func setupScoreLabel() {
        self.scoreLabel = SKLabelNode(text: "SCORE: 0")
        self.scoreLabel.fontName = "HelveticaNeue-UltraLight"
        self.scoreLabel.fontColor = Colors.blackColor()
        self.scoreLabel.fontSize = 22.0
        self.scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        self.addChild(self.scoreLabel)
    }
    
    override public func didMoveToView(view: SKView) {
        render()
        
        var layer = CAShapeLayer()
        layer.borderColor = Colors.colorFor(0xAEAEAE).CGColor
        layer.borderWidth = 1.0
        layer.frame = self.grid.frame
        
        self.view!.layer.addSublayer(layer)
    }
    
    private func render() {
        self.backgroundColor = Colors.whiteColor()
        positionGrid()
        positionScoreLabel()
    }
    
    private func positionGrid() {
        self.grid.position.x = (self.view!.frame.width - self.grid.frame.width) / 2
        self.grid.position.y = (self.view!.frame.height - self.grid.frame.height) / 2
    }
    
    private func positionScoreLabel() {
        self.scoreLabel.position.x = self.grid.position.x
        self.scoreLabel.position.y = self.grid.frame.maxY + 5.0
    }
    
    public func updateScore(score: Int) {
        self.scoreLabel.text = "SCORE: \(score)"
    }
}