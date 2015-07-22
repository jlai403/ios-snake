import SpriteKit

public class Snake {
    
    var vector: [SnakeCell] = []
    
    var length: Int {
        get {
            return self.vector.count
        }
    }
    
    var head: SnakeCell {
        get {
            return self.vector.firstOrDefault({ (bodyNode) in bodyNode.isHead() })!
        }
    }
    
    var tail: SnakeCell {
        get {
            return self.vector.firstOrDefault({ (bodyNode) in bodyNode.isTail() })!
        }
    }
       
    public func move(destination: Cell) {
        if (canMoveTo(destination)) {
            moveBodyForward()
            head.setPosition(destination)
        }
    }
    
    private func canMoveTo(destination: Cell) -> Bool {
        return self.head.predecessor!.cell!.position != destination.position
    }
    
    private func moveBodyForward() {
        var snakeCell:SnakeCell? = tail
        while (snakeCell != nil) {
            snakeCell!.moveForward()
            snakeCell = snakeCell?.successor
        }
    }
}
