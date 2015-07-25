import UIKit
import SpriteKit

class GameController: UIViewController {

    @IBOutlet var gameView: SKView!
    
    var snakeGame: SnakeGame!
    
    override func viewDidLoad() {
        if (ConfigConstants.DEBUG) {
            self.gameView.showsFPS = true
            self.gameView.showsNodeCount = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        initSnakeGame()
        realignGameView()
    }
    
    private func initSnakeGame() {
        self.snakeGame = SnakeGame(gameViewSize: self.gameView.frame.size, rows: ConfigConstants.GAME_GRID_ROWS, columns: ConfigConstants.GAME_GRID_COLS)
    }

    private func realignGameView() {
        self.gameView.frame.size = self.snakeGame.scene.size
        self.gameView.center = self.view.center
        
        self.gameView.layer.borderColor = Colors.pictonBlue.CGColor
        self.gameView.layer.borderWidth = 1.0
    }

    override func viewDidAppear(animated: Bool) {
        self.snakeGame.prepareScene()
        self.gameView.presentScene(self.snakeGame.scene)
        self.snakeGame.start()
    }
    
    @IBAction func changeDirections(sender: UISwipeGestureRecognizer) {
        var direction = getCardinalDirection(sender.direction)
        self.snakeGame.updateDirection(direction)
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


