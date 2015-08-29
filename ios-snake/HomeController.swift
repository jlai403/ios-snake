import UIKit

class HomeController: UIViewController {
    
    @IBAction func startNewGame(sender: AnyObject) {
        self.performSegueWithIdentifier("startGameSegue", sender: self)
    }
    
    @IBAction func goBackHome(segue: UIStoryboardSegue) {
        
    }
}