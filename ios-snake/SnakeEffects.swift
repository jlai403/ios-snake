import UIKit
import SpriteKit

public class SnakeEffects {
    
    public func applyGradient(player: Snake) {
        var alphaDifference = 1.0 / CGFloat(player.length)
        var alpha = CGFloat(1.0)
        for element in player.vector {
            element.alpha = alpha
            alpha -= alphaDifference
        }
    }
    
    public func blink(element: SnakeElement) {
        var alpha = element.alpha
        var fade = SKAction.runBlock{ element.alpha *= 0.50 }
        var wait = SKAction.waitForDuration(0.25)
        var brighten = SKAction.runBlock{ element.alpha /= 0.50 }
        element.runAction(SKAction.sequence([fade, wait, brighten, wait, fade, wait, brighten]))
    }
}