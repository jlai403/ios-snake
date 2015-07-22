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
        var snake = Snake()
        var debug = self.grid!
        var snakeGameControl = SnakeGameControl(grid: grid!)
        snakeGameControl.initiateGame(snake) // (12,7), (11,7), (10,7)

        snakeGameControl.updateDirection(.North)
    
        // act
        snakeGameControl.move(snake)
        
        // assert
        assertSnakeTilePosition(expected: (13,7), actual: snake.vector[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell!, message: "tail")
    
        XCTAssertEqual(CellType.Snake, grid!.position(row: 13, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid!.position(row: 12, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid!.position(row: 11, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid!.position(row: 10, col: 7).type, "cell type should be of type Empty")
    }
    
    func test_moveEast() {
        // assemble
        var snake = Snake()
        var snakeGameControl = SnakeGameControl(grid: grid!)
        snakeGameControl.initiateGame(snake) // (12,7), (11,7), (10,7)
        
        snakeGameControl.updateDirection(.East)
        
        // act
        snakeGameControl.move(snake)
        
        // assert
        assertSnakeTilePosition(expected: (12,8), actual: snake.vector[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell!, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid!.position(row: 12, col: 8).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid!.position(row: 12, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid!.position(row: 11, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid!.position(row: 10, col: 7).type, "cell type should be of type Empty")
    }
    
    func test_moveWest() {
        // assemble
        var snake = Snake()
        var snakeGameControl = SnakeGameControl(grid: grid!)
        snakeGameControl.initiateGame(snake) // (12,7), (11,7), (10,7)
        
        snakeGameControl.updateDirection(.West)
        
        // act
        snakeGameControl.move(snake)
        
        // assert
        assertSnakeTilePosition(expected: (12,6), actual: snake.vector[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell!, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid!.position(row: 12, col: 6).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid!.position(row: 12, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid!.position(row: 11, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid!.position(row: 10, col: 7).type, "cell type should be of type Empty")
    }
    
    func test_moveSouth_moveEast2x() {
        // assemble
        var snake = Snake()
        var snakeGameControl = SnakeGameControl(grid: grid!)
        snakeGameControl.initiateGame(snake) // (12,7), (11,7), (10,7)
        
        snakeGameControl.updateDirection(.East)
        snakeGameControl.move(snake) // (12,8), (12,7), (11,7)
        snakeGameControl.move(snake) // (12,8), (12,8), (12,7)
        
        snakeGameControl.updateDirection(.South)

        // act
        snakeGameControl.move(snake)
        
        // assert
        assertSnakeTilePosition(expected: (11,9), actual: snake.vector[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (12,9), actual: snake.vector[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (12,8), actual: snake.vector[2].cell!, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid!.position(row: 11, col: 9).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid!.position(row: 12, col: 9).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid!.position(row: 12, col: 8).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid!.position(row: 12, col: 7).type, "cell type should be of type Empty")
    }
    
    func test_updateDirectionSouth_currentDirectionNorth() {
        // assemble
        var snake = Snake()
        var snakeGameControl = SnakeGameControl(grid: grid!)
        snakeGameControl.initiateGame(snake) // (12,7), (11,7), (10,7)
        
        // act
        snakeGameControl.updateDirection(.South)
        snakeGameControl.move(snake)
        
        // assert
        assertSnakeTilePosition(expected: (13,7), actual: snake.vector[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell!, message: "tail")
    }
    
    func test_updateDirectionNorth_currentDirectionSouth() {
        // assemble
        var snake = Snake()
        var snakeGameControl = SnakeGameControl(grid: grid!)
        snakeGameControl.initiateGame(snake) // (12,7), (11,7), (10,7)
        
        snakeGameControl.updateDirection(.West)
        snakeGameControl.move(snake)  // (12,6), (12,7), (11,7)

        snakeGameControl.updateDirection(.South)
        snakeGameControl.move(snake) // (11,6), (12,6), (12,7)
        
        // act
        snakeGameControl.updateDirection(.North)
        snakeGameControl.move(snake)
        
        // assert
        assertSnakeTilePosition(expected: (10,6), actual: snake.vector[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (11,6), actual: snake.vector[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (12,6), actual: snake.vector[2].cell!, message: "tail")
    }
    
    func test_updateDirectionEast_currentDirectionWest() {
        // assemble
        var snake = Snake()
        var snakeGameControl = SnakeGameControl(grid: grid!)
        snakeGameControl.initiateGame(snake) // (12,7), (11,7), (10,7)
        
        snakeGameControl.updateDirection(.West)
        snakeGameControl.move(snake) // (12,6), (12,7), (11,77)
        
        // act
        snakeGameControl.updateDirection(.East)
        snakeGameControl.move(snake)
        
        // assert
        assertSnakeTilePosition(expected: (12,5), actual: snake.vector[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (12,6), actual: snake.vector[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[2].cell!, message: "tail")
    }
    
    
    func test_updateDirectionWest_currentDirectionEast() {
        // assemble
        var snake = Snake()
        var snakeGameControl = SnakeGameControl(grid: grid!)
        snakeGameControl.initiateGame(snake) // (12,7), (11,7), (10,7)
        
        snakeGameControl.updateDirection(.East)
        snakeGameControl.move(snake) // (12,8), (12,7), (11,7)
        
        // act
        snakeGameControl.updateDirection(.West)
        snakeGameControl.move(snake)
        
        // assert
        assertSnakeTilePosition(expected: (12,9), actual: snake.vector[0].cell!, message: "head")
        assertSnakeTilePosition(expected: (12,8), actual: snake.vector[1].cell!, message: "middle")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[2].cell!, message: "tail")
    }
    
    
    //MARK: assert helpers
    
    private func assertSnakeTilePosition(#expected: (row: Int, column: Int), actual: Cell, message: String = "") {
        XCTAssertEqual(expected.row, actual.row, "wrong row (\(message))")
        XCTAssertEqual(expected.column, actual.column, "wrong column (\(message))")
    }
}

