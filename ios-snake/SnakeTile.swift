import SpriteKit

public class SnakeTile: SKShapeNode {
    
    var cell: Cell?
    
    var successor: SnakeTile?
    var predecessor: SnakeTile?
    
    class func new(successor: SnakeTile?, cell: Cell) -> SnakeTile {
        var snakeTile = SnakeTile(rect: CGRect(origin: CGPointZero, size: cell.size))
        snakeTile.update(successor, cell: cell)
        return snakeTile
    }
    
    public func update(parent: SnakeTile?, cell: Cell) {
        self.setParent(parent)
        self.setPosition(cell)
        self.style()
    }
    
    private func setParent(parent: SnakeTile?) {
        parent?.predecessor = self
        self.successor = parent
    }
    
    public func setPosition(cell: Cell) {
        self.cell = cell
        self.position = cell.position
    }
    
    private func style() {
        self.fillColor = Colors.lightBlue
        self.strokeColor = Colors.whiteColor()
    }
    
    public func moveForward() {
        if let nextNode = self.successor {
            self.setPosition(nextNode.cell!)
        }
    }
    
    public func isHead() -> Bool {
        return successor == nil
    }
    
    public func isTail() -> Bool {
        return predecessor == nil
    }
}