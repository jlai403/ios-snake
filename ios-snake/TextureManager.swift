import SpriteKit

class TextureManager {
    
    static var sharedInstance = TextureManager()
    
    var tileTexutre: SKTexture
    
    private init() {
        tileTexutre = SKTexture(imageNamed: "Square Tile")
    }

}