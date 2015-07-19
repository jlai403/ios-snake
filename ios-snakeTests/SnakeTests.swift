import snake
import UIKit
import XCTest

class SnakeTests: XCTestCase {
    
    var grid: Grid?
    
    override func setUp() {
        super.setUp()
        self.grid = GridGenerator.createGrid(viewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        
    }
    
    override func tearDown() {
        super.tearDown()
        self.grid = nil
    }
    
    func test_moveNorth() {
        // assemble
        var gridCenter = grid!.center()
        var snake = Snake(initPosition: gridCenter) // (7,12)
       
        // act
        snake.move(.North)
               
        // assert
        XCTAssertEqual(snake.body[0].gridPosition!.x, 7, "wrong head x position")
        XCTAssertEqual(snake.body[0].gridPosition!.y, 13, "wrong head y position")
        XCTAssertEqual(snake.body[1].gridPosition!.x, 7, "wrong middle x position")
        XCTAssertEqual(snake.body[1].gridPosition!.y, 12, "wrong middle x position")
        XCTAssertEqual(snake.body[2].gridPosition!.x, 7, "wrong tail x position")
        XCTAssertEqual(snake.body[2].gridPosition!.y, 11, "wrong middle y position")
    }
    
    func test_moveEast() {
        // assemble
        var gridCenter = grid!.center()
        var snake = Snake(initPosition: gridCenter) // (7,12)
        
        // act
        snake.move(.East)
        
        // assert
        XCTAssertEqual(snake.body[0].gridPosition!.x, 8, "wrong head x position")
        XCTAssertEqual(snake.body[0].gridPosition!.y, 12, "wrong head y position")
        XCTAssertEqual(snake.body[1].gridPosition!.x, 7, "wrong middle x position")
        XCTAssertEqual(snake.body[1].gridPosition!.y, 12, "wrong middle x position")
        XCTAssertEqual(snake.body[2].gridPosition!.x, 7, "wrong tail x position")
        XCTAssertEqual(snake.body[2].gridPosition!.y, 11, "wrong middle y position")
    }
    
    func test_moveWest() {
        // assemble
        var gridCenter = grid!.center()
        var snake = Snake(initPosition: gridCenter) // (7,12)
        
        // act
        snake.move(.West)
        
        // assert
        XCTAssertEqual(snake.body[0].gridPosition!.x, 6, "wrong head x position")
        XCTAssertEqual(snake.body[0].gridPosition!.y, 12, "wrong head y position")
        XCTAssertEqual(snake.body[1].gridPosition!.x, 7, "wrong middle x position")
        XCTAssertEqual(snake.body[1].gridPosition!.y, 12, "wrong middle x position")
        XCTAssertEqual(snake.body[2].gridPosition!.x, 7, "wrong tail x position")
        XCTAssertEqual(snake.body[2].gridPosition!.y, 11, "wrong middle y position")
    }
    
    func test_moveSouth_moveEast2x() {
        // assemble
        var gridCenter = grid!.center()
        var snake = Snake(initPosition: gridCenter) // (7,12)
        
        snake.move(.East) // (8,12), (7,12), (7,11)
        snake.move(.East) // (9,12), (8,12), (7,12)
        
        // act
        snake.move(.South)
        
        // assert
        XCTAssertEqual(snake.body[0].gridPosition!.x, 9, "wrong head x position")
        XCTAssertEqual(snake.body[0].gridPosition!.y, 11, "wrong head y position")
        XCTAssertEqual(snake.body[1].gridPosition!.x, 9, "wrong middle x position")
        XCTAssertEqual(snake.body[1].gridPosition!.y, 12, "wrong middle x position")
        XCTAssertEqual(snake.body[2].gridPosition!.x, 8, "wrong tail x position")
        XCTAssertEqual(snake.body[2].gridPosition!.y, 12, "wrong middle y position")
    }
    
    func test_moveSouth_blockedByBodyNode() {
        // assemble
        var gridCenter = grid!.center()
        var snake = Snake(initPosition: gridCenter) // (7,12)
        
        // act
        snake.move(.South)
        
        // assert
        XCTAssertEqual(snake.body[0].gridPosition!.x, 7, "wrong head x position")
        XCTAssertEqual(snake.body[0].gridPosition!.y, 12, "wrong head y position")
        XCTAssertEqual(snake.body[1].gridPosition!.x, 7, "wrong middle x position")
        XCTAssertEqual(snake.body[1].gridPosition!.y, 11, "wrong middle x position")
        XCTAssertEqual(snake.body[2].gridPosition!.x, 7, "wrong tail x position")
        XCTAssertEqual(snake.body[2].gridPosition!.y, 10, "wrong middle y position")
    }
    
    func test_moveNorth_moveWest1xSouth1x_blockedByBodyNode() {
        // assemble
        var gridCenter = grid!.center()
        var snake = Snake(initPosition: gridCenter) // (7,12)
        snake.move(.West)  // (6,12), (7,12), (7,11)
        snake.move(.South) // (6,11), (6,12), (7,12)
        
        // act
        snake.move(.North)
        
        // assert
        XCTAssertEqual(snake.body[0].gridPosition!.x, 6, "wrong head x position")
        XCTAssertEqual(snake.body[0].gridPosition!.y, 11, "wrong head y position")
        XCTAssertEqual(snake.body[1].gridPosition!.x, 6, "wrong middle x position")
        XCTAssertEqual(snake.body[1].gridPosition!.y, 12, "wrong middle x position")
        XCTAssertEqual(snake.body[2].gridPosition!.x, 7, "wrong tail x position")
        XCTAssertEqual(snake.body[2].gridPosition!.y, 12, "wrong middle y position")
    }
    
    func test_moveEast_moveWest1x_blockedByBodyNode() {
        // assemble
        var gridCenter = grid!.center()
        var snake = Snake(initPosition: gridCenter) // (7,12)
        
        snake.move(.West) // (6,12), (7,12), (7,11)
        
        // act
        snake.move(.East)
        
        // assert
        XCTAssertEqual(snake.body[0].gridPosition!.x, 6, "wrong head x position")
        XCTAssertEqual(snake.body[0].gridPosition!.y, 12, "wrong head y position")
        XCTAssertEqual(snake.body[1].gridPosition!.x, 7, "wrong middle x position")
        XCTAssertEqual(snake.body[1].gridPosition!.y, 12, "wrong middle x position")
        XCTAssertEqual(snake.body[2].gridPosition!.x, 7, "wrong tail x position")
        XCTAssertEqual(snake.body[2].gridPosition!.y, 11, "wrong middle y position")
    }
    
    
    func test_moveWest_moveEast1x_blockedByBodyNode() {
        // assemble
        var gridCenter = grid!.center()
        var snake = Snake(initPosition: gridCenter) // (7,12)
        
        snake.move(.East) // (8,12), (7,12), (7,11)
        
        // act
        snake.move(.West)
        
        // assert
        XCTAssertEqual(snake.body[0].gridPosition!.x, 8, "wrong head x position")
        XCTAssertEqual(snake.body[0].gridPosition!.y, 12, "wrong head y position")
        XCTAssertEqual(snake.body[1].gridPosition!.x, 7, "wrong middle x position")
        XCTAssertEqual(snake.body[1].gridPosition!.y, 12, "wrong middle x position")
        XCTAssertEqual(snake.body[2].gridPosition!.x, 7, "wrong tail x position")
        XCTAssertEqual(snake.body[2].gridPosition!.y, 11, "wrong middle y position")
    }
}
