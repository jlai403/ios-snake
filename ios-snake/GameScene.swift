import SpriteKit

public class GameScene: SKScene {
    
    var scoreLabel: SKLabelNode!
    
    public override init(size: CGSize) {
        super.init(size: size)
        setupScene()
        styleScene()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    private func setupScene() {
        setupScoreLabel()
    }
    
    private func setupScoreLabel() {
        self.scoreLabel = SKLabelNode(text: "SCORE: 0")
        self.scoreLabel.fontName = "HelveticaNeue-UltraLight"
        self.scoreLabel.fontColor = Colors.blackColor()
        self.scoreLabel.fontSize = 22.0
        self.scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        
        var margin: CGFloat = 5.0
        var scorePositionX = margin
        var scorePositionY = self.size.height - self.scoreLabel.frame.height - margin
        self.scoreLabel.position = CGPointMake(scorePositionX, scorePositionY)
        self.scoreLabel.zPosition = GameSceneZPositions.INTERFACE
        self.addChild(self.scoreLabel)
    }
    
    private func styleScene() {
        self.backgroundColor = Colors.colorFor(0xFEFEFE)
    }
    
    override public func didMoveToView(view: SKView) {
    }
    
    public func updateScore(score: Int) {
        self.scoreLabel.text = "SCORE: \(score)"
    }
}

public struct GameSceneZPositions {

    static var INTERFACE: CGFloat = 100.0
    static var GAME_ELEMENT: CGFloat = 0.0
    
}