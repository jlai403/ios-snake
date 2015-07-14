import snake
import UIKit
import XCTest

class ios_snakeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func moveUp() {
        // assemble
        var snake = Snake()
        var zeroPosition = CGPointMake(0.0, 0.0)
        snake.position(zeroPosition)
        
        // act
        snake.move(.Up)
               
        // assert
        XCTAssertEqual(snake.body[0].position, CGPointMake(0.0, 16.0), "position should be (0.0, 16.0)")
        XCTAssertEqual(snake.body[1].position, CGPointMake(0.0, 0.0), "position should be (0.0, 0.0)")
        XCTAssertEqual(snake.body[2].position, CGPointMake(0.0, -16.0), "position should be (0.0, -16.0)")
    }
}
