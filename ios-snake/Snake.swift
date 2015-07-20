import SpriteKit

public class Snake {
    
    let START_BODY_LENGTH = 3
    
    var body: [SnakeTile] = []
    
    var length: Int {
        get {
            return self.body.count
        }
    }
    
    public init(cell: Cell) {
        var cell = cell
        
        for (var i=0; i<START_BODY_LENGTH; i++) {
            var successor: SnakeTile? = i==0 ? nil : body[i-1]
            var predecessor = SnakeTile.new(successor, cell: cell)
            body.append(predecessor)

            cell.y -= 1
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
        var destination = getDestinationCell(direction)
        
        if (canMoveTo(destination)) {
            moveBodyForward()
            head.setPosition(destination)
        }
        
    }
    
    private func canMoveTo(destination: Cell) -> Bool {
        return self.head.predecessor!.cell!.position != destination.position
    }
    
    private func getDestinationCell(direction: CardinalDirection) -> Cell {
        var destinationGridElement = head.cell!
        
        switch (direction) {
        case .North:
            destinationGridElement.y += 1
        case .South:
            destinationGridElement.y -= 1
        case .East:
            destinationGridElement.x += 1
        case .West:
            destinationGridElement.x -= 1
        default:
            fatalError("invalid cardinal direction")
        }
        
        return destinationGridElement
    }
    
    private func moveBodyForward() {
        var traverse:SnakeTile? = tail
        
        while (traverse != nil) {
            traverse!.moveForward()
            traverse = traverse?.successor
        }
    }
}
