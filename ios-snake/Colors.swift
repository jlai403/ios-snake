import UIKit

public class Colors: UIColor {
    
    static let blue = Colors.colorFor(0x326BFF)
    
    static let pomegranate = Colors.colorFor(0xF22613)
    
    class func colorFor(hexColor: Int32 ) -> UIColor {
        let r = CGFloat(((hexColor & 0x00FF0000) >> 16)) / 255.0
        let g = CGFloat(((hexColor & 0x0000FF00) >> 8)) / 255.0
        let b = CGFloat(hexColor & 0x000000FF) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}