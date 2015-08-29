import SpriteKit

public class ScoreNode: SKLabelNode {
    
    override init() {
        super.init()
        self.update()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func update() {
        self.updateScore(0)
        self.fontName = "HelveticaNeue-UltraLight"
        self.fontColor = Colors.blackColor()
        self.fontSize = 22.0
        self.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
    }
    
    public func updateScore(score: Int) {
        self.text = "SCORE: \(score)"
    }
}