import snake
import UIKit
import XCTest

class SnakeGameTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_moveNorth() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)

        snakeGame.updateDirection(.North)
    
        // act
        snakeGame.updatePlayerMovements()
        
        // assert
        assertSnakeTilePosition(expected: (13,7), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "tail")
    
        XCTAssertEqual(CellType.Snake, grid.position(row: 13, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(row: 12, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(row: 11, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid.position(row: 10, col: 7).type, "cell type should be of type Empty")
    }
    
    func test_moveEast() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.East)
        
        // act
        snakeGame.updatePlayerMovements()
        
        // assert
        assertSnakeTilePosition(expected: (12,8), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid.position(row: 12, col: 8).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(row: 12, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(row: 11, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid.position(row: 10, col: 7).type, "cell type should be of type Empty")
    }
    
    func test_moveWest() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.West)
        
        // act
        snakeGame.updatePlayerMovements()
        
        // assert
        assertSnakeTilePosition(expected: (12,6), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid.position(row: 12, col: 6).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(row: 12, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(row: 11, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid.position(row: 10, col: 7).type, "cell type should be of type Empty")
    }
    
    func test_moveSouth_moveEast2x() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.East)
        snakeGame.updatePlayerMovements() // (12,8), (12,7), (11,7)
        snakeGame.updatePlayerMovements() // (12,8), (12,8), (12,7)
        
        snakeGame.updateDirection(.South)

        // act
        snakeGame.updatePlayerMovements()
        
        // assert
        assertSnakeTilePosition(expected: (11,9), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,9), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (12,8), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid.position(row: 11, col: 9).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(row: 12, col: 9).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(row: 12, col: 8).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid.position(row: 12, col: 7).type, "cell type should be of type Empty")
    }
    
    func test_updateDirectionSouth_currentDirectionNorth() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        // act
        snakeGame.updateDirection(.South)
        snakeGame.updatePlayerMovements()
        
        // assert
        assertSnakeTilePosition(expected: (13,7), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "tail")
    }
    
    func test_updateDirectionNorth_currentDirectionSouth() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.West)
        snakeGame.updatePlayerMovements()  // (12,6), (12,7), (11,7)

        snakeGame.updateDirection(.South)
        snakeGame.updatePlayerMovements() // (11,6), (12,6), (12,7)
        
        // act
        snakeGame.updateDirection(.North)
        snakeGame.updatePlayerMovements()
        
        // assert
        assertSnakeTilePosition(expected: (10,6), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (11,6), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (12,6), actual: snake.vector[2].cell, message: "tail")
    }
    
    func test_updateDirectionEast_currentDirectionWest() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.West)
        snakeGame.updatePlayerMovements() // (12,6), (12,7), (11,77)
        
        // act
        snakeGame.updateDirection(.East)
        snakeGame.updatePlayerMovements()
        
        // assert
        assertSnakeTilePosition(expected: (12,5), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,6), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[2].cell, message: "tail")
    }
    
    func test_updateDirectionWest_currentDirectionEast() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.East)
        snakeGame.updatePlayerMovements() // (12,8), (12,7), (11,7)
        
        // act
        snakeGame.updateDirection(.West)
        snakeGame.updatePlayerMovements()
        
        // assert
        assertSnakeTilePosition(expected: (12,9), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,8), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[2].cell, message: "tail")
    }
    
    func test_powerUpPosition() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        // act
        var powerUp = snakeGame.snakeGameControl.powerUp
        
        // assert
        XCTAssertNotEqual(powerUp.cell, snake.vector[0].cell, "power up cell position is already taken by snake")
        XCTAssertEqual(powerUp.cell.type, CellType.PowerUp, "cell type should be power up")
    }
    
    func test_consumePowerUp() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)

        snakeGame.snakeGameControl.powerUp = PowerUpElement(cell: grid.position(row: 13, col: 7))

        // act
        snakeGame.updatePlayerMovements()

        // assert
        XCTAssertEqual(4, snake.length, "snake should have a length of 4")
        assertSnakeTilePosition(expected: (13,7), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle 1")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "middle 2")
        assertSnakeTilePosition(expected: (10,7), actual: snake.vector[3].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid.position(row: 13, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(row: 12, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(row: 11, col: 7).type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(row: 10, col: 7).type, "cell type should be of type Empty")
    }
    
    //MARK: assert helpers
    
    private func assertSnakeTilePosition(#expected: (row: Int, column: Int), actual: Cell, message: String = "") {
        XCTAssertEqual(expected.row, actual.row, "wrong row (\(message))")
        XCTAssertEqual(expected.column, actual.column, "wrong column (\(message))")
    }
}

