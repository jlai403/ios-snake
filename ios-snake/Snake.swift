import SpriteKit

public class Snake {
    
    let START_BODY_LENGTH = 3
    
    var body: [SnakeBodyNode] = []
    
    var length: Int {
        get {
            return self.body.count
        }
    }
    
    public init() {
        initSnake()
    }
    
    var head: SnakeBodyNode {
        get {
            return self.body.firstOrDefault({ (bodyNode) in bodyNode.isHead() })!
        }
    }
    
    var tail: SnakeBodyNode {
        get {
            return self.body.firstOrDefault({ (bodyNode) in bodyNode.isTail() })!
        }
    }
    
    private func initSnake() {
        for (var i=0; i<START_BODY_LENGTH; i++) {
            var parentNode: SnakeBodyNode? = i==0 ? nil : body[i-1]
            
            var newNode = SnakeBodyNode.new(parentNode)
            body.append(newNode)
        }
    }
    
    public func position(position: CGPoint) {
        for bodyNode in body {
            if (bodyNode.isHead()) {
                bodyNode.position(position: position)
            } else {
                bodyNode.position()
            }
        }
    }
    
    public func move(direction: CardinalDirection) {
        var destination = getDestinationPoint(direction)
        
        if (canMoveTo(destination)) {
            moveBodyForward()
            head.position = destination
        }
        
    }
    
    private func canMoveTo(destination: CGPoint) -> Bool {
        return self.head.prevNode!.position != destination
    }
    
    private func getDestinationPoint(direction: CardinalDirection) -> CGPoint {
        var destinationPoint = head.position
        
        switch (direction) {
        case .North:
            destinationPoint.y += head.frame.height
        case .South:
            destinationPoint.y -= head.frame.height
        case .East:
            destinationPoint.x += head.frame.width
        case .West:
            destinationPoint.x -= head.frame.width
        default:
            fatalError("impossible snake movemment")
        }
        
        return destinationPoint
    }
    
    private func moveBodyForward() {
        var traverseNode:SnakeBodyNode? = tail
        
        while (traverseNode != nil) {
            traverseNode!.moveForward()
            traverseNode = traverseNode?.nextNode
        }
    }
}

public class SnakeBodyNode: SKShapeNode {
    
    private static let BODY_SIZE: CGSize = CGSizeMake(15.0, 15.0)
    
    var nextNode: SnakeBodyNode?
    var prevNode: SnakeBodyNode?
    
    class func new(parent: SnakeBodyNode?) -> SnakeBodyNode {
        var bodyPart = SnakeBodyNode(rectOfSize: BODY_SIZE)
        bodyPart.update(parent)
        return bodyPart
    }
    
    public func update(parent: SnakeBodyNode?) {
        parent?.prevNode = self
        self.nextNode = parent
        
        //TODO: bug? - fillColor doubles the number of nodes created
        self.fillColor = Colors.lightBlue
        self.strokeColor = Colors.whiteColor()
    }
    
    public func position(position: CGPoint? = nil) {
        if let newPosition = position {
            self.position = newPosition
        } else {
            self.position = nextNode!.position
            self.position.y -= nextNode!.frame.size.height
        }
    }
    
    public func moveForward() {
        if let nextNode = self.nextNode {
            self.position = nextNode.position
        }
    }
    
    public func isHead() -> Bool {
        return nextNode == nil
    }
   
    public func isTail() -> Bool {
        return prevNode == nil
    }
}
