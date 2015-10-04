import UIKit
import CoreData


public protocol IScoreboardManager {
    func log(username: String, score: Int)
    func fetchHighScores() -> [HighScoreEntry]
    func clear()
}

public class ScoreboardManager: IScoreboardManager {
    
    static var sharedInstance: IScoreboardManager = ScoreboardManager()
    
    var managedObjectContext:NSManagedObjectContext!
    
    init() {
    }
    
    public static func setManagedObjectContext(managedObjectContext: NSManagedObjectContext) {
        if let scoreBoardManager = ScoreboardManager.sharedInstance as? ScoreboardManager {
            scoreBoardManager.managedObjectContext = managedObjectContext
        }
    }
    
    public func log(username: String, score: Int) {
        
        let entity = NSEntityDescription.entityForName("HighScoreEntry", inManagedObjectContext: self.managedObjectContext)
        print(entity?.managedObjectClassName)
        let highScoreEntry = HighScoreEntry(entity: entity!, insertIntoManagedObjectContext: self.managedObjectContext)
        highScoreEntry.username = username
        highScoreEntry.score = score
    }
    
    public func fetchHighScores() -> [HighScoreEntry] {
        let fetchRequest = NSFetchRequest(entityName: "HighScoreEntry")
        let highScoreEntries = (try! self.managedObjectContext.executeFetchRequest(fetchRequest)) as! [HighScoreEntry]
        return highScoreEntries
    }
    
    public func clear() {
        self.managedObjectContext.reset()
    }
}


public class DoNothingScoreboardManager: IScoreboardManager {
    
    init() {
    }
    
    public func log(username: String, score: Int) {
    }
    
    public func fetchHighScores() -> [HighScoreEntry] {
        return [HighScoreEntry]()
    }
    
    public func clear() {
    }
}