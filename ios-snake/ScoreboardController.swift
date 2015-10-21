import UIKit

class ScoreboardController: UIViewController, UITableViewDataSource, UITableViewDelegate    {
    
    var highScores: [HighScoreEntry] = []
    @IBOutlet var scoreboardTableView: UITableView!
    
    override func viewDidLoad() {
        setupTableView()
    }
    
    private func setupTableView() {
        self.scoreboardTableView.dataSource = self
        self.scoreboardTableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.highScores = ScoreboardManager.sharedInstance.fetchHighScores()
    }
    
    // MARK: TableView Data Source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScores.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ScoreEntryCell", forIndexPath: indexPath)
        let highScoreEntry = highScores[indexPath.row]
        
        cell.textLabel?.text = highScoreEntry.username
        cell.detailTextLabel?.text = highScoreEntry.score.stringValue
        
        return cell
    }
    
}