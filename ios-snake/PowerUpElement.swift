import SpriteKit

public class PowerUpElement: SKShapeNode {
    var cell: Cell
    
    init(cell: Cell) {
        self.cell = cell
        super.init()
        
        self.update()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
    
    func update() {
        self.setPosition(self.cell)
        self.style()
    }
    
    
    public func setPosition(cell: Cell) {
        self.cell = cell
        self.cell.type = .PowerUp
        self.position = cell.position
    }
    
    private func style() {
        self.path = CGPathCreateWithRoundedRect(CGRect(origin: CGPointZero, size: cell.size), 0, 0, nil)
        
        self.lineWidth = 1.5
        self.fillColor = Colors.pomegranate
        self.strokeColor = Colors.whiteColor()
    }

    
}