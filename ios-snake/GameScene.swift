import SpriteKit

public class GameScene: SKScene {
    
    public override init(size: CGSize) {
        super.init(size: size)
        styleGrid()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }

    private func styleGrid() {
        self.backgroundColor = Colors.colorFor(0xFEFEFE)
    }
    
    override public func didMoveToView(view: SKView) {
    }
}