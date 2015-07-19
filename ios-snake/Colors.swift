import UIKit

public class Colors: UIColor {
    
    static let lightBlue = UIColor(red: 0.4, green: 0.8, blue: 1, alpha: 1)
    static let jordyBlue = UIColor(red: 0.5372, green: 0.7686, blue: 0.9568, alpha: 1)
    
    static let emeraldGreen = UIColor(red: 0.1803, green: 0.8, blue: 0.4431, alpha: 1)
    static let greenSea = UIColor(red: 0.0862, green: 0.6274, blue: 0.5215, alpha: 1)
    
    static let capeHoney = UIColor(red: 0.9921, green: 0.8901, blue: 0.6549, alpha: 1)
    
    class func colorFor(hexColor: Int32 ) -> UIColor {
        var r = CGFloat(((hexColor & 0x00FF0000) >> 16)) / 255.0
        var g = CGFloat(((hexColor & 0x0000FF00) >> 8)) / 255.0
        var b = CGFloat(hexColor & 0x000000FF) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}