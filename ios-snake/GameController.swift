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
        updateGameGrid()
        updateGameGridView()
    }
    
    private func updateGameGrid() {
        var grid = GridGenerator.createGrid(viewSize: gameGridView.frame.size, rows: ConfigConstants.GAME_GRID_ROWS, columns: ConfigConstants.GAME_GRID_COLS)
        self.gameGrid = GameGridScene(grid: grid)
    }
    
    private func updateGameGridView() {
        var x = self.view.center.x - (self.gameGrid!.size.width / 2)
        var y = self.view.frame.height - self.gameGrid!.size.height - 10.0
        var origin = CGPointMake(x, y)
        self.gameGridView.frame = CGRect(origin: origin, size: self.gameGrid!.size)
        
        self.gameGridView.layer.borderColor = Colors.colorFor(0x888888).CGColor
        self.gameGridView.layer.borderWidth = 3.0
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


