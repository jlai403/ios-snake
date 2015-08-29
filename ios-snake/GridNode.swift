import SpriteKit

public class GridNode: SKSpriteNode {
 
    init(size: CGSize) {
        super.init(texture: nil, color: Colors.colorFor(0xFEFEFE), size: size)
        self.update()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func update() {
        self.anchorPoint = CGPointZero
    }

}