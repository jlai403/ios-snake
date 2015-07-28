import UIKit
import SpriteKit

public class SnakeStyler {
    
    public func style(player: Snake) {
        var opacityDifference = 1.0 / CGFloat(player.length)
        var opacity = CGFloat(1.0)
        for element in player.vector {
            element.lineWidth = 1.5
            element.fillColor = Colors.blue
            element.strokeColor = Colors.whiteColor()
            element.alpha = opacity
            
            opacity -= opacityDifference
        }
    }
    
    public func blink(element: SnakeElement) {
        var alpha = element.alpha
        var fade = SKAction.runBlock{ element.alpha *= 0.10 }
        var wait = SKAction.waitForDuration(0.25)
        var brighten = SKAction.runBlock{ element.alpha /= 0.10 }
        element.runAction(SKAction.sequence([fade, wait, brighten, wait, fade, wait, brighten]))
    }
}