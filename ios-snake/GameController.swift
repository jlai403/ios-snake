import UIKit
import SpriteKit

class GameController: UIViewController {

    @IBOutlet var gameGridView: SKView!
    var gameScene: GameScene?
    
    override func viewDidLoad() {
        if (ConfigConstants.DEBUG) {
            self.gameGridView.showsFPS = true
            self.gameGridView.showsNodeCount = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        updateGameScene()
        updateGameGridView()
    }
    
    private func updateGameScene() {
        var grid = GridGenerator.createGrid(viewSize: gameGridView.frame.size, rows: ConfigConstants.GAME_GRID_ROWS, columns: ConfigConstants.GAME_GRID_COLS)
        self.gameScene = GameScene(grid: grid)
    }
    
    private func updateGameGridView() {
        var x = self.view.center.x - (self.gameScene!.size.width / 2)
        var y = self.view.frame.height - self.gameScene!.size.height - 10.0
        var origin = CGPointMake(x, y)
        self.gameGridView.frame = CGRect(origin: origin, size: self.gameScene!.size)
        
        self.gameGridView.layer.borderColor = Colors.colorFor(0x888888).CGColor
        self.gameGridView.layer.borderWidth = 3.0
    }

    override func viewDidAppear(animated: Bool) {
        self.gameGridView.presentScene(self.gameScene)
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


