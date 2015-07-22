import SpriteKit

public class Snake {
    
    var vector: [SnakeElement] = []
    
    var length: Int {
        get {
            return self.vector.count
        }
    }
    
    var head: SnakeElement {
        get {
            return self.vector.firstOrDefault({ (bodyNode) in bodyNode.isHead() })!
        }
    }
    
    var tail: SnakeElement {
        get {
            return self.vector.firstOrDefault({ (bodyNode) in bodyNode.isTail() })!
        }
    }
       
    public func move(destination: Cell) {
        if (canMoveTo(destination)) {
            moveVectorForward()
            head.setPosition(destination)
        }
    }
    
    private func canMoveTo(destination: Cell) -> Bool {
        return self.head.predecessor!.cell != destination
    }
    
    private func moveVectorForward() {
        var snakeElement = tail
        while let successor = snakeElement.successor {
            snakeElement.moveForward()
            snakeElement = successor
        }
    }
}
