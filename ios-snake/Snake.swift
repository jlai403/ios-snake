import SpriteKit

public class Snake {
    
    let START_BODY_LENGTH = 3
    
    var body: [SnakeBody] = []
    
    var reverseBody: [SnakeBody] {
        get { return body.reverse() }
    }
    
    var length: Int {
        get {
            return self.body.count
        }
    }
    
    public init() {
        initSnake()
    }
    
    private func initSnake() {
        for (var i=0; i<START_BODY_LENGTH; i++) {
            var parentNode: SnakeBody? = i==0 ? nil : body[i-1]
            
            var newNode = SnakeBody.new(parentNode)
            body.append(newNode)
        }
    }
    
    public func position(position: CGPoint) {
        for bodyNode in body {
            if (bodyNode.isHead) {
                bodyNode.updatePosition(position: position)
            } else {
                bodyNode.updatePosition()
            }
        }
    }
    
    public func move(direction: SnakeMovementDirection) {
        switch (direction) {
        case SnakeMovementDirection.Up:
            moveUp()
        case SnakeMovementDirection.Down:
            moveDown()
        case SnakeMovementDirection.Right:
            moveRight()
        case SnakeMovementDirection.Left:
            moveLeft()
        default:
            fatalError("impossible snake movemment")
        }
    }
    
    private func moveUp() {
        for bodyNode in reverseBody {
            if (bodyNode.isHead) {
                bodyNode.position.y += bodyNode.frame.height
            } else {
                bodyNode.position = bodyNode.nextNode!.position
            }
        }
    }
    
    private func moveDown() {
        for bodyNode in reverseBody {
            if (bodyNode.isHead) {
                bodyNode.position.y -= bodyNode.frame.height
            } else {
                bodyNode.position = bodyNode.nextNode!.position
            }
        }
    }
    
    private func moveRight() {
        for bodyNode in reverseBody {
            if (bodyNode.isHead) {
                bodyNode.position.x += bodyNode.frame.width
            } else {
                bodyNode.position = bodyNode.nextNode!.position
            }
        }
    }
    
    private func moveLeft() {
        for bodyNode in reverseBody {
            if (bodyNode.isHead) {
                bodyNode.position.x -= bodyNode.frame.width
            } else {
                bodyNode.position = bodyNode.nextNode!.position
            }
        }
    }
}

public class SnakeBody: SKShapeNode {
    
    private static let BODY_SIZE: CGSize = CGSizeMake(15.0, 15.0)
    
    var nextNode: SnakeBody?
    var prevNode: SnakeBody?
    
    var isHead: Bool {
        get { return nextNode == nil }
    }
    
    var isTail: Bool {
        get { return prevNode == nil }
    }
    
    
    class func new(parent: SnakeBody?) -> SnakeBody {
        var bodyPart = SnakeBody(rectOfSize: BODY_SIZE)
        bodyPart.update(parent)
        return bodyPart
    }
    
    public func update(parent: SnakeBody?) {
        parent?.prevNode = self
        self.nextNode = parent
    }
    
    public func updatePosition(position: CGPoint? = nil) {
        if let newPosition = position {
            self.position = newPosition
        } else {
            self.position = nextNode!.position
            self.position.y -= nextNode!.frame.size.height
        }
    }
}