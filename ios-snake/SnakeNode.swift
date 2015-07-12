import SpriteKit

class Snake {
    
    let START_BODY_LENGTH = 3
    
    var body: [SnakeBody] = []
    
    var length: Int {
        get {
            return self.body.count
        }
    }
    
    init() {
        initSnake()
    }
    
    private func initSnake() {
        for (var i=0; i<START_BODY_LENGTH; i++) {
            var parentNode: SnakeBody? = i==0 ? nil : body[i-1]
            
            var newNode = SnakeBody.new(parentNode)
            body.append(newNode)
        }
    }
    
    func position(position: CGPoint) {
        for bodyNode in body {
            if (bodyNode.isHead) {
                bodyNode.updatePosition(position: position)
            } else {
                bodyNode.updatePosition()
            }
        }
    }
}



class SnakeBody: SKShapeNode {
    
    private static let BODY_SIZE: CGSize = CGSizeMake(20.0, 20.0)
    
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
    
    func update(parent: SnakeBody?) {
        self.nextNode = parent
        parent?.prevNode = self
    }
    
    func updatePosition(position: CGPoint? = nil) {
        if let newPosition = position {
            self.position = newPosition
        } else {
            self.position = nextNode!.position
            self.position.y += nextNode!.frame.size.height
        }
    }
}