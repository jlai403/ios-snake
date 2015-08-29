import UIKit
import SpriteKit

class GameController: UIViewController, SnakeGameControllerDelegate, UIAlertViewDelegate {

    @IBOutlet var gameView: SKView!
    
    var snakeGame: SnakeGame!
    
    override func viewDidLoad() {
        if (ConfigConstants.DEBUG) {
            self.gameView.showsFPS = true
            self.gameView.showsNodeCount = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        initGame()
    }
    
    private func initGame() {
        self.snakeGame = SnakeGame(gameViewSize: self.gameView.frame.size, rows: ConfigConstants.GAME_GRID_ROWS, columns: ConfigConstants.GAME_GRID_COLS)
        self.snakeGame.delegate = self
    }

    override func viewDidAppear(animated: Bool) {
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
    
    // MARK: SnakeGameDelegate
    
    func notifyGameOver(score: Int) {
        var gameOverAlert = GameOverAlertView()
        gameOverAlert.delegate = self
        gameOverAlert.show(score)
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if (alertView is GameOverAlertView){
            gameOverAlertActions(buttonIndex)
        }
    }

    private func gameOverAlertActions(buttonIndex: Int) {
        switch (buttonIndex) {
        case 0:
            snakeGame.reset()
            snakeGame.start()
            break
        case 1:
            exit(0)
        default:
            fatalError("impossible action")
        }
    }
}