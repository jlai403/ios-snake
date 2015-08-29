import UIKit

class HomeController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    @IBAction func startNewGame(sender: AnyObject) {
        self.performSegueWithIdentifier("startGameSegue", sender: self)
    }
    
    @IBAction func startMultiplayerGame(sender: AnyObject) {
        self.performSegueWithIdentifier("startMultiplayerGameSegue", sender: self)
    }
    
    @IBAction func goToSettings(sender: AnyObject) {
        self.performSegueWithIdentifier("goToSettingsSegue", sender: self)
    }
    
    @IBAction func goToScoreboard(sender: AnyObject) {
        self.performSegueWithIdentifier("goToScoreboardSegue", sender: self)
    }
    
    @IBAction func goBackHome(segue: UIStoryboardSegue) {
        
    }
}