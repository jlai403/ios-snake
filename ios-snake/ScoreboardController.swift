import UIKit

class ScoreboardController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
//        var highScores = ScoreboardManager.sharedInstance.fetchHighScores()
    }
}