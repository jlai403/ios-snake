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
        var centerCell = grid!.center()
        var snake = Snake(cell: centerCell) // (7,12)
       
        // act
        snake.move(.North)
               
        // assert
        assertSnakeTilePosition(expected: (7,13), actual: snake.cells[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (7,12), actual: snake.cells[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (7,11), actual: snake.cells[2].cell!, message: "tail")
    }
    
    func test_moveEast() {
        // assemble
        var centerCell = grid!.center()
        var snake = Snake(cell: centerCell) // (7,12)
        
        // act
        snake.move(.East)
        
        // assert
        assertSnakeTilePosition(expected: (8,12), actual: snake.cells[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (7,12), actual: snake.cells[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (7,11), actual: snake.cells[2].cell!, message: "tail")
    }
    
    func test_moveWest() {
        // assemble
        var centerCell = grid!.center()
        var snake = Snake(cell: centerCell) // (7,12)
        
        // act
        snake.move(.West)
        
        // assert
        assertSnakeTilePosition(expected: (6,12), actual: snake.cells[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (7,12), actual: snake.cells[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (7,11), actual: snake.cells[2].cell!, message: "tail")
    }
    
    func test_moveSouth_moveEast2x() {
        // assemble
        var gridCenter = grid!.center()
        var snake = Snake(cell: gridCenter) // (7,12)
        
        snake.move(.East) // (8,12), (7,12), (7,11)
        snake.move(.East) // (9,12), (8,12), (7,12)
        
        // act
        snake.move(.South)
        
        // assert
        assertSnakeTilePosition(expected: (9,11), actual: snake.cells[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (9,12), actual: snake.cells[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (8,12), actual: snake.cells[2].cell!, message: "tail")
    }
    
    func test_moveSouth_blockedBycellsNode() {
        // assemble
        var centerCell = grid!.center()
        var snake = Snake(cell: centerCell) // (7,12)
        
        // act
        snake.move(.South)
        
        // assert
        assertSnakeTilePosition(expected: (7,12), actual: snake.cells[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (7,11), actual: snake.cells[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (7,10), actual: snake.cells[2].cell!, message: "tail")
    }
    
    func test_moveNorth_moveWest1xSouth1x_blockedBycellsNode() {
        // assemble
        var centerCell = grid!.center()
        var snake = Snake(cell: centerCell) // (7,12)
        snake.move(.West)  // (6,12), (7,12), (7,11)
        snake.move(.South) // (6,11), (6,12), (7,12)
        
        // act
        snake.move(.North)
        
        // assert
        assertSnakeTilePosition(expected: (6,11), actual: snake.cells[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (6,12), actual: snake.cells[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (7,12), actual: snake.cells[2].cell!, message: "tail")
    }
    
    func test_moveEast_moveWest1x_blockedBycellsNode() {
        // assemble
        var centerCell = grid!.center()
        var snake = Snake(cell: centerCell) // (7,12)
        
        snake.move(.West) // (6,12), (7,12), (7,11)
        
        // act
        snake.move(.East)
        
        // assert
        assertSnakeTilePosition(expected: (6,12), actual: snake.cells[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (7,12), actual: snake.cells[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (7,11), actual: snake.cells[2].cell!, message: "tail")
    }
    
    
    func test_moveWest_moveEast1x_blockedBycellsNode() {
        // assemble
        var centerCell = grid!.center()
        var snake = Snake(cell: centerCell) // (7,12)
        
        snake.move(.East) // (8,12), (7,12), (7,11)
        
        // act
        snake.move(.West)
        
        // assert
        assertSnakeTilePosition(expected: (8,12), actual: snake.cells[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (7,12), actual: snake.cells[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (7,11), actual: snake.cells[2].cell!, message: "tail")
    }
    
    //MARK: assert helpers
    
    private func assertSnakeTilePosition(#expected: (x: Int, y: Int), actual: Cell, message: String = "") {
        XCTAssertEqual(expected.x, actual.x, "wrong x position (\(message))")
        XCTAssertEqual(expected.y, actual.y, "wrong y position (\(message))")
    }
}
