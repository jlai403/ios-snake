import SpriteKit

public class SnakeCell: SKShapeNode {
    
    var cell: Cell?
    
    var successor: SnakeCell?
    var predecessor: SnakeCell?
    
    class func new(successor: SnakeCell?, cell: Cell) -> SnakeCell {
        var snakeTile = SnakeCell(rect: CGRect(origin: CGPointZero, size: cell.size), cornerRadius: 2.5)
        snakeTile.update(successor, cell: cell)
        return snakeTile
    }
    
    public func update(parent: SnakeCell?, cell: Cell) {
        self.setParent(parent)
        self.setPosition(cell)
        self.style()
    }
    
    private func setParent(parent: SnakeCell?) {
        parent?.predecessor = self
        self.successor = parent
    }
    
    public func setPosition(cell: Cell) {
        self.cell = cell
        self.cell!.type = .Snake
        self.position = cell.position
    }
    
    private func style() {
        self.lineWidth = 1.5
        self.fillColor = Colors.lightBlue
        self.strokeColor = Colors.whiteColor()
    }
    
    public func moveForward() {
        if (self.isTail()) {
            cell!.type = .Empty
        }
        
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