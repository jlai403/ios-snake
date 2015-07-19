import SpriteKit

public class SnakeTileNode: SKShapeNode {
    
    var gridPosition: GridPosition?
    var nextNode: SnakeTileNode?
    var prevNode: SnakeTileNode?
    
    class func new(parent: SnakeTileNode?, gridPosition: GridPosition) -> SnakeTileNode {
        var bodyPart = SnakeTileNode(rectOfSize: gridPosition.grid.tileSize)
        bodyPart.update(parent, gridPosition: gridPosition)
        return bodyPart
    }
    
    public func update(parent: SnakeTileNode?, gridPosition: GridPosition) {
        self.setParent(parent)
        self.setPosition(gridPosition)
        self.style()
    }
    
    private func setParent(parent: SnakeTileNode?) {
        parent?.prevNode = self
        self.nextNode = parent
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
        if let nextNode = self.nextNode {
            self.setPosition(nextNode.gridPosition!)
        }
    }
    
    public func isHead() -> Bool {
        return nextNode == nil
    }
    
    public func isTail() -> Bool {
        return prevNode == nil
    }
}