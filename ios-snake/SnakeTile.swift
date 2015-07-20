import SpriteKit

public class SnakeTile: SKShapeNode {
    
    var gridPosition: GridPosition?
    var successor: SnakeTile?
    var predecessor: SnakeTile?
    
    class func new(successor: SnakeTile?, gridPosition: GridPosition) -> SnakeTile {
        var snakeTile = SnakeTile(rect: CGRect(origin: CGPointZero, size: gridPosition.size))
        snakeTile.update(successor, gridPosition: gridPosition)
        return snakeTile
    }
    
    public func update(parent: SnakeTile?, gridPosition: GridPosition) {
        self.setParent(parent)
        self.setPosition(gridPosition)
        self.style()
    }
    
    private func setParent(parent: SnakeTile?) {
        parent?.predecessor = self
        self.successor = parent
    }
    
    public func setPosition(gridPosition: GridPosition) {
        self.gridPosition = gridPosition
        self.position = gridPosition.position
    }
    
    private func style() {
        self.fillColor = Colors.lightBlue
        self.strokeColor = Colors.whiteColor()
    }
    
    public func moveForward() {
        if let nextNode = self.successor {
            self.setPosition(nextNode.gridPosition!)
        }
    }
    
    public func isHead() -> Bool {
        return successor == nil
    }
    
    public func isTail() -> Bool {
        return predecessor == nil
    }
}