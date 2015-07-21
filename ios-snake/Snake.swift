import SpriteKit

public class Snake {
    
    let START_BODY_LENGTH = 3
    
    var vector: [SnakeCell] = []
    
    var length: Int {
        get {
            return self.vector.count
        }
    }
    
    public init(cell: Cell) {
        var cell = cell
        
        for (var i=0; i<START_BODY_LENGTH; i++) {
            var successor: SnakeCell? = i==0 ? nil : vector[i-1]
            var predecessor = SnakeCell.new(successor, cell: cell)
            vector.append(predecessor)

            cell.y -= 1
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
        var destinationCell = head.cell!
        
        switch (direction) {
        case .North:
            destinationCell.y += 1
        case .South:
            destinationCell.y -= 1
        case .East:
            destinationCell.x += 1
        case .West:
            destinationCell.x -= 1
        default:
            fatalError("invalid cardinal direction")
        }
        
        return destinationCell
    }
    
    private func moveBodyForward() {
        var snakeCell:SnakeCell? = tail
        
        while (snakeCell != nil) {
            snakeCell!.moveForward()
            snakeCell = snakeCell?.successor
        }
    }
}
