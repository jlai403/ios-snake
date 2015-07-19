import UIKit
import SpriteKit

class GameController: UIViewController {

    @IBOutlet var gameGridView: SKView!
    var gameGrid: GameGridScene?
    
    override func viewDidLoad() {
        if (ConfigConstants.DEBUG) {
            self.gameGridView.showsFPS = true
            self.gameGridView.showsNodeCount = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        var grid = GridGenerator.createGrid(viewSize: gameGridView.frame.size, rows: ConfigConstants.GAME_GRID_ROWS, columns: ConfigConstants.GAME_GRID_COLS)
       
        self.gameGrid = GameGridScene(grid: grid)
        
        self.gameGridView.frame.size = grid.size
        self.gameGridView.center = self.view.center
        self.gameGridView.layer.borderColor = Colors.colorFor(0x888888).CGColor
        self.gameGridView.layer.borderWidth = 1.0
    }
    

    override func viewDidAppear(animated: Bool) {
        self.gameGridView.presentScene(self.gameGrid)
    }
    
    @IBAction func changeDirections(sender: UISwipeGestureRecognizer) {
        var direction = getCardinalDirection(sender.direction)
        gameGrid!.updateDirection(direction)
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


