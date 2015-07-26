import UIKit

public class Colors: UIColor {
    
    static let blue = Colors.colorFor(0x306AFF)
    
    static let pomegranate = Colors.colorFor(0xF22613)
    
    class func colorFor(hexColor: Int32 ) -> UIColor {
        var r = CGFloat(((hexColor & 0x00FF0000) >> 16)) / 255.0
        var g = CGFloat(((hexColor & 0x0000FF00) >> 8)) / 255.0
        var b = CGFloat(hexColor & 0x000000FF) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}