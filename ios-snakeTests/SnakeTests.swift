import snake
import UIKit
import XCTest

class SnakeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_moveNorth() {
        // assemble
        var snake = Snake()
        var zeroPosition = CGPointMake(0.0, 0.0)
        snake.position(zeroPosition)
        
        // act
        snake.move(.North)
               
        // assert
        XCTAssertEqual(snake.body[0].position, CGPointMake(0.0, 10.0), "wrong head position")
        XCTAssertEqual(snake.body[1].position, CGPointMake(0.0, 0.0), "wrong middle position")
        XCTAssertEqual(snake.body[2].position, CGPointMake(0.0, -10.0), "wrong tail position")
    }
    
    func test_moveEast() {
        // assemble
        var snake = Snake()
        var zeroPosition = CGPointMake(0.0, 0.0)
        snake.position(zeroPosition)
        
        // act
        snake.move(.East)
        
        // assert
        XCTAssertEqual(snake.body[0].position, CGPointMake(10.0, 0.0), "wrong head position")
        XCTAssertEqual(snake.body[1].position, CGPointMake(0.0, 0.0), "wrong middle position")
        XCTAssertEqual(snake.body[2].position, CGPointMake(0.0, -10.0), "wrong tail position")
    }
    
    func test_moveWest() {
        // assemble
        var snake = Snake()
        var zeroPosition = CGPointMake(0.0, 0.0)
        snake.position(zeroPosition)
        
        // act
        snake.move(.West)
        
        // assert
        XCTAssertEqual(snake.body[0].position, CGPointMake(-10.0, 0.0), "wrong head position")
        XCTAssertEqual(snake.body[1].position, CGPointMake(0.0, 0.0), "wrong middle position")
        XCTAssertEqual(snake.body[2].position, CGPointMake(0.0, -10.0), "wrong tail position")
    }
    
    func test_moveSouth_moveEast3x() {
        // assemble
        var snake = Snake()
        var zeroPosition = CGPointMake(0.0, 0.0)
        snake.position(zeroPosition)
        
        snake.move(.East) // (10.0, 0.0), (0.0, 0.0), (0.0, -10.0)
        snake.move(.East) // (20.0, 0.0), (10.0, 0.0), (0.0, 0.0)
        snake.move(.East) // (30.0, 0.0), (20.0, 0.0), (10.0, 0.0)
        
        // act
        snake.move(.South)
        
        // assert
        XCTAssertEqual(snake.body[0].position, CGPointMake(30, -10.0), "wrong head position")
        XCTAssertEqual(snake.body[1].position, CGPointMake(30.0, 0.0), "wrong middle position")
        XCTAssertEqual(snake.body[2].position, CGPointMake(20.0, 0.0), "wrong tail position")
    }
    
    func test_moveSouth_blockedByBodyNode() {
        // assemble
        var snake = Snake()
        var zeroPosition = CGPointMake(0.0, 0.0)
        snake.position(zeroPosition)
        
        // act
        snake.move(.South)
        
        // assert
        XCTAssertEqual(snake.body[0].position, CGPointMake(0.0, 0.0), "wrong head position")
        XCTAssertEqual(snake.body[1].position, CGPointMake(0.0, -10.0), "wrong middle position")
        XCTAssertEqual(snake.body[2].position, CGPointMake(0.0, -20.0), "wrong tail position")
    }
    
    func test_moveNorth_moveWest1xSouth2x_blockedByBodyNode() {
        // assemble
        var snake = Snake()
        var zeroPosition = CGPointMake(0.0, 0.0)
        snake.position(zeroPosition)
        
        snake.move(.West)
        snake.move(.South)
        snake.move(.South)
        
        var expectedHeadPosition = snake.head.position
        var expectedMiddlePosition = snake.body[1].position
        var expectedTailPosition = snake.body[2].position
        
        // act
        snake.move(.North)
        
        // assert
        XCTAssertEqual(snake.head.position, expectedHeadPosition, "head position should have stayed the same")
        XCTAssertEqual(snake.body[1].position, expectedMiddlePosition, "middle position should have stayed the same")
        XCTAssertEqual(snake.body[2].position, expectedTailPosition, "tail position should have stayed the same")
    }
    
    func test_moveEast_moveWest1x_blockedByBodyNode() {
        // assemble
        var snake = Snake()
        var zeroPosition = CGPointMake(0.0, 0.0)
        snake.position(zeroPosition)
        
        snake.move(.West)
        
        var expectedHeadPosition = snake.head.position
        var expectedMiddlePosition = snake.body[1].position
        var expectedTailPosition = snake.body[2].position
        
        // act
        snake.move(.East)
        
        // assert
        XCTAssertEqual(snake.head.position, expectedHeadPosition, "head position should have stayed the same")
        XCTAssertEqual(snake.body[1].position, expectedMiddlePosition, "middle position should have stayed the same")
        XCTAssertEqual(snake.body[2].position, expectedTailPosition, "tail position should have stayed the same")
    }
    
    
    func test_moveWest_moveEast1x_blockedByBodyNode() {
        // assemble
        var snake = Snake()
        var zeroPosition = CGPointMake(0.0, 0.0)
        snake.position(zeroPosition)
        
        snake.move(.East)
        
        var expectedHeadPosition = snake.head.position
        var expectedMiddlePosition = snake.body[1].position
        var expectedTailPosition = snake.body[2].position
        
        // act
        snake.move(.West)
        
        // assert
        XCTAssertEqual(snake.head.position, expectedHeadPosition, "head position should have stayed the same")
        XCTAssertEqual(snake.body[1].position, expectedMiddlePosition, "middle position should have stayed the same")
        XCTAssertEqual(snake.body[2].position, expectedTailPosition, "tail position should have stayed the same")
    }
}
