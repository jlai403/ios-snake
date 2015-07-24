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
    
    public func present(player: Snake) {
        for snakeCell in player.vector {
            self.addChild(snakeCell)
        }
    }

    public func present(powerUp: PowerUpElement) {
        self.addChild(powerUp)
    }

}