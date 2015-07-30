import UIKit
import SpriteKit

class GameController: UIViewController, SnakeGameControllerDelegate, UIAlertViewDelegate {

    @IBOutlet var gameView: SKView!
    
    @IBOutlet var scoreLabel: UILabel!
    var snakeGame: SnakeGame!
    
    override func viewDidLoad() {
        if (ConfigConstants.DEBUG) {
            self.gameView.showsFPS = true
            self.gameView.showsNodeCount = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        initGame()
        realignViews()
    }
    
    private func initGame() {
        self.snakeGame = SnakeGame(gameViewSize: self.gameView.frame.size, rows: ConfigConstants.GAME_GRID_ROWS, columns: ConfigConstants.GAME_GRID_COLS)
        self.snakeGame.delegate = self
    }

    private func realignViews() {
        self.gameView.frame.size = self.snakeGame.grid.size
        self.gameView.center = self.view.center
        var gameView = self.gameView
        var game = self.snakeGame
        
        self.gameView.layer.borderColor = Colors.blue.CGColor
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
    
    // MARK: SnakeGameDelegate
    func updateScore(score: Int) {
    }
    
    func notifyGameOver() {
        var gameOverAlert = GameOverAlertView()
        gameOverAlert.delegate = self
        gameOverAlert.title = "Game Over"
        gameOverAlert.addButtonWithTitle("Retry")
        gameOverAlert.addButtonWithTitle("Quit")
        gameOverAlert.show()
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