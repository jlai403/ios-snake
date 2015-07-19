import SpriteKit

public class Snake {
    
    let START_BODY_LENGTH = 3
    
    var body: [SnakeTileNode] = []
    
    var length: Int {
        get {
            return self.body.count
        }
    }
    
    public init(initPosition: GridPosition) {
        
        var position = initPosition
        
        for (var i=0; i<START_BODY_LENGTH; i++) {
            var parentNode: SnakeTileNode? = i==0 ? nil : body[i-1]
            var newNode = SnakeTileNode.new(parentNode, gridPosition: position)
            body.append(newNode)

            position.y -= 1
        }
    }
    
    var head: SnakeTileNode {
        get {
            return self.body.firstOrDefault({ (bodyNode) in bodyNode.isHead() })!
        }
    }
    
    var tail: SnakeTileNode {
        get {
            return self.body.firstOrDefault({ (bodyNode) in bodyNode.isTail() })!
        }
    }
   
    public func move(direction: CardinalDirection) {
        var destination = getDestinationGridPosition(direction)
        
        if (canMoveTo(destination)) {
            moveBodyForward()
            head.setPosition(destination)
        }
        
    }
    
    private func canMoveTo(destination: GridPosition) -> Bool {
        var debug = self.head.prevNode!
        return self.head.prevNode!.gridPosition!.position != destination.position
    }
    
    private func getDestinationGridPosition(direction: CardinalDirection) -> GridPosition {
        var destinationGridPosition = head.gridPosition!
        
        switch (direction) {
        case .North:
            destinationGridPosition.y += 1
        case .South:
            destinationGridPosition.y -= 1
        case .East:
            destinationGridPosition.x += 1
        case .West:
            destinationGridPosition.x -= 1
        default:
            fatalError("invalid cardinal direction")
        }
        
        return destinationGridPosition
    }
    
    private func moveBodyForward() {
        var traverseNode:SnakeTileNode? = tail
        
        while (traverseNode != nil) {
            traverseNode!.moveForward()
            traverseNode = traverseNode?.nextNode
        }
    }
}
