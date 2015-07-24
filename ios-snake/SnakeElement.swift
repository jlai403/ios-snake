import SpriteKit

public class SnakeElement: SKShapeNode {
    
    var cell: Cell
    
    var successor: SnakeElement?
    var predecessor: SnakeElement?
    
    init(cell: Cell, successor: SnakeElement?) {
        self.cell = cell
        super.init()
        self.update(successor)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
    
    public func update(successor: SnakeElement?) {
        self.setSuccessor(successor)
        self.style()
        self.setPosition(self.cell)
    }
    
    private func setSuccessor(successor: SnakeElement?) {
        successor?.predecessor = self
        self.successor = successor
    }
    
    public func setPosition(cell: Cell) {
        self.cell = cell
        self.cell.type = .Snake
        self.position = cell.position
    }
    
    private func style() {
        self.path = CGPathCreateWithRoundedRect(CGRect(origin: CGPointZero, size: cell.size), 0, 0, nil)
        self.lineWidth = 1.5
        self.fillColor = Colors.pictonBlue
        self.strokeColor = Colors.whiteColor()
    }
    
    public func moveForward() {
        if (self.isTail()) {
            cell.type = .Empty
        }
        
        if let nextNode = self.successor {
            self.setPosition(nextNode.cell)
        }
    }
    
    public func isHead() -> Bool {
        return successor == nil
    }
    
    public func isTail() -> Bool {
        return predecessor == nil
    }
}