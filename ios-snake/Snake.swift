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
    
    init(startingCell: Cell) {
        var cell = startingCell
        
        for (var i=0; i<ConfigConstants.START_SNAKE_LENGTH; i++) {
            var successor: SnakeElement? = i==0 ? nil : self.vector[i-1]
            var predecessor = SnakeElement(cell: cell, successor:successor)
            self.vector.append(predecessor)
            
            if (self.vector.count < ConfigConstants.START_SNAKE_LENGTH) {
                cell = cell.south()!
            }
        }
    }
    
    deinit {
        for element in vector {
            element.removeFromParent()
        }
        self.vector.removeAll(keepCapacity: false)
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
    
    public func consume(powerUp: PowerUpElement) {
        var newHead = SnakeElement(cell: powerUp.cell)
        self.head.setElementSuccessor(newHead)
        self.vector.insert(newHead, atIndex: 0)
    }
}
