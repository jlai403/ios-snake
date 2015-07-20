import SpriteKit

public class Snake {
    
    let START_BODY_LENGTH = 3
    
    var body: [SnakeTile] = []
    
    var length: Int {
        get {
            return self.body.count
        }
    }
    
    public init(initPosition: GridPosition) {
        
        var position = initPosition
        
        for (var i=0; i<START_BODY_LENGTH; i++) {
            var successor: SnakeTile? = i==0 ? nil : body[i-1]
            var predecessor = SnakeTile.new(successor, gridPosition: position)
            body.append(predecessor)

            position.y -= 1
        }
    }
    
    var head: SnakeTile {
        get {
            return self.body.firstOrDefault({ (bodyNode) in bodyNode.isHead() })!
        }
    }
    
    var tail: SnakeTile {
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
        return self.head.predecessor!.gridPosition!.position != destination.position
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
        var traverse:SnakeTile? = tail
        
        while (traverse != nil) {
            traverse!.moveForward()
            traverse = traverse?.successor
        }
    }
}
