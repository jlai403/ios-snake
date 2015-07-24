import UIKit
import SpriteKit

class GameController: UIViewController {

    @IBOutlet var gameView: SKView!
    var gameScene: GameScene!
    
    override func viewDidLoad() {
        if (ConfigConstants.DEBUG) {
            self.gameView.showsFPS = true
            self.gameView.showsNodeCount = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        initGameScene()
        realignGameView()
    }
    
    private func initGameScene() {
        self.gameScene = GameScene(gameView: gameView)
    }
    
    private func realignGameView() {
        self.gameView.frame.size = self.gameScene.size
        self.gameView.center = self.view.center
        
        self.gameView.layer.borderColor = Colors.pictonBlue.CGColor
        self.gameView.layer.borderWidth = 1.0
    }

    override func viewDidAppear(animated: Bool) {
        self.gameView.presentScene(self.gameScene)
    }
    
    @IBAction func changeDirections(sender: UISwipeGestureRecognizer) {
        var direction = getCardinalDirection(sender.direction)
        gameScene!.updateDirection(direction)
    }
    
    private func getCardinalDirection(swipeDirection: UISwipeGestureRecognizerDirection) -> CardinalDirection {
        switch (swipeDirection) {
        case UISwipeGestureRecognizerDirection.Up:
            return .North
        case UISwipeGestureRecognizerDirection.Down:
            return .South
        case UISwipeGestureRecognizerDirection.Right:
            return .East
        case UISwipeGestureRecognizerDirection.Left:
            return .West
        default:
            fatalError("invalid direction")
        }
    }
}


