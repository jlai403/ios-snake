import UIKit
import SpriteKit

class GameController: UIViewController {

    @IBOutlet var gameView: SKView!
    var gameScene: GameScene?
    
    override func viewDidLoad() {
        self.gameScene = GameScene(size: self.gameView.frame.size)
        
        if (ConfigConstants.DEBUG) {
            self.gameView.showsFPS = true
            self.gameView.showsNodeCount = true
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        self.gameView.presentScene(self.gameScene)
    }
    
    @IBAction func changeDirections(sender: UISwipeGestureRecognizer) {
        var direction = getSnakeMovementDirection(sender.direction)
        gameScene!.updateDirection(direction)
    }
    
    private func getSnakeMovementDirection(swipeDirection: UISwipeGestureRecognizerDirection) -> SnakeMovementDirection {
        switch (swipeDirection) {
        case UISwipeGestureRecognizerDirection.Up:
            return .Up
        case UISwipeGestureRecognizerDirection.Down:
            return .Down
        case UISwipeGestureRecognizerDirection.Left:
            return .Left
        case UISwipeGestureRecognizerDirection.Right:
            return .Right
        default:
            fatalError("impossible swipe direction")
        }
    }
}

