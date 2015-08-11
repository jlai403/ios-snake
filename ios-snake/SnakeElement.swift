import SpriteKit

public class SnakeElement: SKShapeNode {
    
    var cell: Cell
    var successor: SnakeElement?
    var predecessor: SnakeElement?
    
    var presented: Bool = false
    
    init(cell: Cell, successor: SnakeElement? = nil) {
        self.cell = cell
        super.init()
        self.render()
        self.update(successor)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
    
    private func render() {
        self.path = CGPathCreateWithRoundedRect(CGRect(origin: CGPointZero, size: cell.size), 0, 0, nil)
        self.position = cell.position
        
        self.lineWidth = 0.5
        self.fillColor = Colors.blue
        self.strokeColor = Colors.whiteColor()
        
        self.zPosition = GameSceneZPositions.GAME_ELEMENT
    }
    
    public func update(successor: SnakeElement?) {
        self.setElementSuccessor(successor)
        self.setPosition(self.cell)
    }
    
    public func setElementSuccessor(successor: SnakeElement?) {
        successor?.predecessor = self
        self.successor = successor
    }
    
    public func setPosition(cell: Cell) {
        self.cell = cell
        self.cell.type = .Snake
        self.runAction(SKAction.moveTo(cell.position, duration: LevelManager.currentTimerInterval))
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