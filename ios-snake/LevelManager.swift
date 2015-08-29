import Foundation

public class LevelManager {
    
    static var currentTimerInterval: Double = 0.0
    
    weak private var target: AnyObject?
    private var selector: Selector
    weak private var timer: NSTimer?
    
    private var currentLevelIndex: Int
    private var levels: [Level] = [Level]()
    
    public var currentLevel: Level {
        get {
            return levels[self.currentLevelIndex]
        }
    }
    
    init(target: AnyObject, selector: String) {
        self.target = target
        self.selector = Selector(selector)
        self.currentLevelIndex = 0
        
        loadLevels()
    }
    
    private func loadLevels() {
        levels.append(Level(level: 1, scoreThreshold: 5, timerInterval: 0.16))
        levels.append(Level(level: 2, scoreThreshold: 10, timerInterval: 0.15))
        levels.append(Level(level: 3, scoreThreshold: 20, timerInterval: 0.14))
        levels.append(Level(level: 4, scoreThreshold: 35, timerInterval: 0.12))
        levels.append(Level(level: 5, scoreThreshold: 50, timerInterval: 0.11))
        levels.append(Level(level: 6, scoreThreshold: 65, timerInterval: 0.10))
        levels.append(Level(level: 7, scoreThreshold: 85, timerInterval: 0.08))
        levels.append(Level(level: 8, scoreThreshold: 100, timerInterval: 0.06))
    }
    
    public func levelUp(snakeGame: SnakeGame) -> Bool {
        if (snakeGame.score < currentLevel.scoreThreshold) {
            return false
        }
        
        self.currentLevelIndex++
        self.stopTimer()
        self.startTimer()
        
        return true
    }
    
    public func startTimer() {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(currentLevel.timerInterval, target: self.target!, selector: self.selector, userInfo: nil, repeats: true)
        LevelManager.currentTimerInterval = currentLevel.timerInterval
    }
    
    private func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    public func reset() {
        self.stopTimer()
        self.currentLevelIndex = 0
    }
}