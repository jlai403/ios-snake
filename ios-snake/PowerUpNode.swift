import SpriteKit

public class PowerUpNode: SKSpriteNode, ISpriteKitNode {
    var cell: Cell
    
    public var presented: Bool = false
    
    init(cell: Cell) {
        self.cell = cell
        super.init(texture: TextureManager.sharedInstance.powerUpTexture, color: Colors.pomegranate, size: self.cell.size)
        self.update()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
    
    deinit {
        self.removeFromParent()
    }
    
    private func update() {
        self.render()
        self.setPosition(self.cell)
    }
    
    
    public func setPosition(cell: Cell) {
        self.cell = cell
        self.cell.type = .PowerUp
        self.position = cell.position
    }
    
    private func render() {
        self.anchorPoint = CGPointZero
        self.colorBlendFactor = 1.0
    }

    
}