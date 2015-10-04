import UIKit
import SpriteKit

public class SnakeEffects {
    
    public func applyGradient(player: Snake) {
        let alphaDifference = 0.5 / CGFloat(player.length)
        var alpha = CGFloat(1.0)
        for element in player.vector {
            element.alpha = alpha
            alpha -= alphaDifference
        }
    }
    
    public func blink(node: SnakeNode) {
        let fade = SKAction.runBlock{ node.alpha *= 0.30 }
        let wait = SKAction.waitForDuration(0.25)
        let brighten = SKAction.runBlock{ node.alpha /= 0.30 }
        node.runAction(SKAction.sequence([fade, wait, brighten, wait, fade, wait, brighten]))
    }
}