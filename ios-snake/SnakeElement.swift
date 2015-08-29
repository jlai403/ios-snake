import SpriteKit

public class SnakeElement: SKSpriteNode {
    
    var cell: Cell
    var successor: SnakeElement?
    var predecessor: SnakeElement?
    
    var presented: Bool = false
    
    init(cell: Cell, successor: SnakeElement? = nil) {
        self.cell = cell
        super.init(texture: TextureManager.sharedInstance.tileTexutre, color: Colors.blue, size: self.cell.size)
        self.update(successor)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
    
    private func update(successor: SnakeElement?) {
        self.render()
        self.setElementSuccessor(successor)
        self.setPosition(self.cell)
    }
    
    private func render() {
        self.anchorPoint = CGPointZero
        self.colorBlendFactor = 1.0
        self.position = cell.position
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