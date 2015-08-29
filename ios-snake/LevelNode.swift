import SpriteKit

public class LevelNode: SKLabelNode {
    
    override init() {
        super.init()
        self.update()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func update() {
        self.updateLevel(1)
        self.fontName = "HelveticaNeue-Thin"
        self.fontColor = Colors.blackColor()
        self.fontSize = 12.0
        self.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
    }
    
    public func updateLevel(level: Int) {
        self.text = "LEVEL: \(level)"
    }
}