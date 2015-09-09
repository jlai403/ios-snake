import SpriteKit

class TextureManager {
    
    static var sharedInstance = TextureManager()
    
    var tileTexture: SKTexture
    var powerUpTexture: SKTexture
    
    private init() {
        tileTexture = SKTexture(imageNamed: "Square Tile")
        powerUpTexture = SKTexture(imageNamed: "Power Up Tile")
    }

}