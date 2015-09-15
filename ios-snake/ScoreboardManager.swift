import UIKit
import CoreData

public class ScoreboardManager {
    
    static var sharedInstance = ScoreboardManager()
    
    private var managedObjectContext:NSManagedObjectContext!
    
    private init() {
    }
    
    public static func setManagedObjectContext(managedObjectContext: NSManagedObjectContext) {
        ScoreboardManager.sharedInstance.managedObjectContext = managedObjectContext
    }
    
    public func log(username: String, score: Int) {
        
        let entity = NSEntityDescription.entityForName("HighScoreEntry", inManagedObjectContext: self.managedObjectContext)
        println(entity?.managedObjectClassName)
        var highScoreEntry = HighScoreEntry(entity: entity!, insertIntoManagedObjectContext: self.managedObjectContext)
        highScoreEntry.username = username
        highScoreEntry.score = score
    }
    
    public func fetchHighScores() -> [HighScoreEntry] {
        let fetchRequest = NSFetchRequest(entityName: "HighScoreEntry")
        var highScoreEntries = self.managedObjectContext.executeFetchRequest(fetchRequest, error: nil) as! [HighScoreEntry]
        return highScoreEntries
    }
    
    public func clear() {
        self.managedObjectContext.reset()
    }
}