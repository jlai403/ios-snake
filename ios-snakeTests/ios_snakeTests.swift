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
    
    func test_moveUp() {
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
    
    func test_moveRight() {
        // assemble
        var snake = Snake()
        var zeroPosition = CGPointMake(0.0, 0.0)
        snake.position(zeroPosition)
        
        // act
        snake.move(.Right)
        
        // assert
        XCTAssertEqual(snake.body[0].position, CGPointMake(16.0, 0.0), "position should be (16.0, 0.0)")
        XCTAssertEqual(snake.body[1].position, CGPointMake(0.0, 0.0), "position should be (0.0, 0.0)")
        XCTAssertEqual(snake.body[2].position, CGPointMake(0.0, -16.0), "position should be (0.0, -16.0)")
    }
    
    func test_moveLeft() {
        // assemble
        var snake = Snake()
        var zeroPosition = CGPointMake(0.0, 0.0)
        snake.position(zeroPosition)
        
        // act
        snake.move(.Left)
        
        // assert
        XCTAssertEqual(snake.body[0].position, CGPointMake(-16.0, 0.0), "position should be (-16.0, 0.0)")
        XCTAssertEqual(snake.body[1].position, CGPointMake(0.0, 0.0), "position should be (0.0, 0.0)")
        XCTAssertEqual(snake.body[2].position, CGPointMake(0.0, -16.0), "position should be (0.0, -16.0)")
    }
    
    func test_moveDown_moveRight3x() {
        // assemble
        var snake = Snake()
        var zeroPosition = CGPointMake(0.0, 0.0)
        snake.position(zeroPosition)
        
        snake.move(.Right) // (16.0, 0.0), (0.0, 0.0), (0.0, -16.0)
        snake.move(.Right) // (32.0, 0.0), (16.0, 0.0), (0.0, 0.0)
        snake.move(.Right) // (48.0, 0.0), (32.0, 0.0), (16.0, 0.0)
        
        // act
        snake.move(.Down)
        
        // assert
        XCTAssertEqual(snake.body[0].position, CGPointMake(48, -16.0), "position should be (-16.0, 0.0)")
        XCTAssertEqual(snake.body[1].position, CGPointMake(48.0, 0.0), "position should be (0.0, 0.0)")
        XCTAssertEqual(snake.body[2].position, CGPointMake(32.0, 0.0), "position should be (0.0, -16.0)")
    }
}
