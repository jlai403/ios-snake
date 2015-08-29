import UIKit

class GameOverAlertView: UIAlertView {
    
    func show(score: Int) {
        self.title = "Game Over"
        self.message = "Score: \(score)"
        self.addButtonWithTitle("Home")
        self.addButtonWithTitle("Retry")
        self.addButtonWithTitle("Quit")
        self.show()
    }
}