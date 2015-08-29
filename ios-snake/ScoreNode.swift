import SpriteKit

class ScoreLabelNode: SKLabelNode {
    
    override init() {
        super.init()
        self.update()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func update() {
        self.text = "SCORE: 0"
        self.fontName = "HelveticaNeue-UltraLight"
        self.fontColor = Colors.blackColor()
        self.fontSize = 22.0
        self.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
    }
}