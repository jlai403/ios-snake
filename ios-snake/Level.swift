
public class Level {
    var level: Int
    var scoreThreshold: Int
    var timerInterval: Double
    
    init(level: Int, scoreThreshold: Int, timerInterval: Double) {
        self.level = level
        self.scoreThreshold = scoreThreshold
        self.timerInterval = timerInterval
    }
}