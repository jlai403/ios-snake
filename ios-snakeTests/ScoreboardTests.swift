import snake
import XCTest
import CoreData

class ScoreboardTests: XCTestCase {
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional...
        let modelURL = NSBundle.mainBundle().URLForResource("Snake", withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL)!
        return managedObjectModel
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application’s saved data."
        if coordinator!.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: &error) == nil {
            coordinator = nil
            let dict = NSMutableDictionary()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application’s saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error
            error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict as [NSObject : AnyObject])
            NSLog("Unresolved error (error), (error!.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext? = {
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    override func setUp() {
        super.setUp()
        ScoreboardManager.setManagedObjectContext(self.managedObjectContext!)
    }
    
    override func tearDown() {
        super.tearDown()
        ScoreboardManager.sharedInstance.clear()
    }
    
    func test_log() {
        // assemble
        var name = "AAA"
        var score = 10
        
        // act
        ScoreboardManager.sharedInstance.log(name, score: score)
        
        // assert
        var highScores = ScoreboardManager.sharedInstance.fetchHighScores()
        XCTAssertEqual(1, highScores.count, "should have 1 high score entry")
    }
    
    func test_clearScores() {
        // assemble
        var name = "AAA"
        var score = 10

        ScoreboardManager.sharedInstance.log(name, score: score)
        
        // act
        ScoreboardManager.sharedInstance.clear()
        
        // assert
        var highScores = ScoreboardManager.sharedInstance.fetchHighScores()
        XCTAssertEqual(0, highScores.count, "should have no high score entries")
    }
}