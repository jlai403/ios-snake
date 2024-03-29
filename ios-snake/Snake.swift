import SpriteKit

public class Snake {
    
    var vector: [SnakeNode] = []
    
    var length: Int {
        get {
            return self.vector.count
        }
    }
    
    var head: SnakeNode {
        get {
            return self.vector.firstOrDefault({ (bodyNode) in bodyNode.isHead() })!
        }
    }
    
    var tail: SnakeNode {
        get {
            return self.vector.firstOrDefault({ (bodyNode) in bodyNode.isTail() })!
        }
    }
    
    init(startingCell: Cell) {
        var cell = startingCell
        
        for (var i=0; i<ConfigConstants.START_SNAKE_LENGTH; i++) {
            let successor: SnakeNode? = i==0 ? nil : self.vector[i-1]
            let predecessor = SnakeNode(cell: cell, successor:successor)
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
        var SnakeNode = tail
        while let successor = SnakeNode.successor {
            SnakeNode.moveForward()
            SnakeNode = successor
        }
    }
    
    public func consume(destination: Cell) {
        let newTail = SnakeNode(cell: tail.cell.south()!, successor: self.tail)
        self.vector.append(newTail)
        self.move(destination)
    }
}
