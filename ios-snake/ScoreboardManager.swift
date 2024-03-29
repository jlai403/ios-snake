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
        saveChanges()
    }
    
    public func fetchHighScores() -> [HighScoreEntry] {
        let fetchRequest = NSFetchRequest(entityName: "HighScoreEntry")
        var highScoreEntries: [HighScoreEntry] = []
        do {
            highScoreEntries = try self.managedObjectContext.executeFetchRequest(fetchRequest) as! [HighScoreEntry]
        } catch {
            print("An error occurred when fetching high score entries.")
        }
        
        return highScoreEntries
    }
    
    public func clear() {
        let fetchRequest = NSFetchRequest(entityName: "HighScoreEntry")
        var highScoreEntries: [NSManagedObject] = []
        highScoreEntries = try! self.managedObjectContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
        for highScoreEntry in highScoreEntries {
            self.managedObjectContext.deleteObject(highScoreEntry)
        }
        saveChanges()
    }
    
    private func saveChanges() {
        do {
            try self.managedObjectContext.save()
        } catch {
            print("An error occured when commiting changes.")
        }
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