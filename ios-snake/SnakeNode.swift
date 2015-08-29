import SpriteKit

public protocol ISpriteKitNode: class {
    var presented: Bool { get set }
}

public class SnakeNode: SKSpriteNode, ISpriteKitNode {
    
    var cell: Cell
    var successor: SnakeNode?
    var predecessor: SnakeNode?
    
    public var presented: Bool = false
    
    init(cell: Cell, successor: SnakeNode? = nil) {
        self.cell = cell
        super.init(texture: TextureManager.sharedInstance.tileTexutre, color: Colors.blue, size: self.cell.size)
        self.update(successor)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
    
    private func update(successor: SnakeNode?) {
        self.render()
        self.setElementSuccessor(successor)
        self.setPosition(self.cell)
    }
    
    private func render() {
        self.anchorPoint = CGPointZero
        self.colorBlendFactor = 1.0
        self.position = cell.position
    }
    
    public func setElementSuccessor(successor: SnakeNode?) {
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