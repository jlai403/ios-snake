import UIKit
import SpriteKit

class GameController: UIViewController, SnakeGameControllerDelegate, UIAlertViewDelegate {

    @IBOutlet weak var gameView: SKView!
    weak var snakeGame: SnakeGame!
    
    deinit {
        println("deinit GameController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        
        if (ConfigConstants.DEBUG) {
            self.gameView.showsFPS = true
            self.gameView.showsNodeCount = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        initSnakeGame()
        self.gameView.presentScene(self.snakeGame.scene)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.gameView.scene?.removeAllActions()
        self.gameView.scene?.removeAllChildren()
        self.gameView.scene?.removeFromParent()
        self.gameView.presentScene(nil)
        self.snakeGame = nil
    }
    
    private func initSnakeGame() {
        self.snakeGame = SnakeGame(gameViewSize: self.gameView.frame.size, rows: ConfigConstants.GAME_GRID_ROWS, columns: ConfigConstants.GAME_GRID_COLS)
        self.snakeGame.delegate = self
    }

    override func viewDidAppear(animated: Bool) {
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
    
    private func goBackHome() {
        self.performSegueWithIdentifier("goBackHomeSegue", sender: self)
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
            self.goBackHome()
            break
        case 1:
            snakeGame.reset()
            snakeGame.start()
        case 2:
            exit(0)
        default:
            fatalError("impossible action")
        }
    }
}