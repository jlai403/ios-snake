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
        snakeGame.snakeGameControl.updatePlayerMovements()
        
        // assert
        assertSnakeTilePosition(expected: (13,7), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "tail")
    
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 13, colIndex: 7)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 12, colIndex: 7)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 11, colIndex: 7)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid.position(rowIndex: 10, colIndex: 7)!.type, "cell type should be of type Empty")
        
        XCTAssertFalse(snakeGame.snakeGameControl.isGameOver, "should not be Game Over")
    }
    
    func test_moveEast() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.East)
        
        // act
        snakeGame.snakeGameControl.updatePlayerMovements()
        
        // assert
        assertSnakeTilePosition(expected: (12,8), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 12, colIndex: 8)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 12, colIndex: 7)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 11, colIndex: 7)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid.position(rowIndex: 10, colIndex: 7)!.type, "cell type should be of type Empty")
        
        XCTAssertFalse(snakeGame.snakeGameControl.isGameOver, "should not be Game Over")
    }
    
    func test_moveWest() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.West)
        
        // act
        snakeGame.snakeGameControl.updatePlayerMovements()
        
        // assert
        assertSnakeTilePosition(expected: (12,6), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 12, colIndex: 6)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 12, colIndex: 7)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 11, colIndex: 7)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid.position(rowIndex: 10, colIndex: 7)!.type, "cell type should be of type Empty")
        
        XCTAssertFalse(snakeGame.snakeGameControl.isGameOver, "should not be Game Over")
    }
    
    func test_moveSouth_moveEast2x() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.East)
        snakeGame.snakeGameControl.updatePlayerMovements() // (12,8), (12,7), (11,7)
        snakeGame.snakeGameControl.updatePlayerMovements() // (12,8), (12,8), (12,7)
        
        snakeGame.updateDirection(.South)

        // act
        snakeGame.snakeGameControl.updatePlayerMovements()
        
        // assert
        assertSnakeTilePosition(expected: (11,9), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,9), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (12,8), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 11, colIndex: 9)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 12, colIndex: 9)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 12, colIndex: 8)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid.position(rowIndex: 12, colIndex: 7)!.type, "cell type should be of type Empty")
        
        XCTAssertFalse(snakeGame.snakeGameControl.isGameOver, "should not be Game Over")
    }
    
    func test_updateDirectionSouth_currentDirectionNorth() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        // act
        snakeGame.updateDirection(.South)
        snakeGame.snakeGameControl.updatePlayerMovements()
        
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
        snakeGame.snakeGameControl.updatePlayerMovements()  // (12,6), (12,7), (11,7)

        snakeGame.updateDirection(.South)
        snakeGame.snakeGameControl.updatePlayerMovements() // (11,6), (12,6), (12,7)
        
        // act
        snakeGame.updateDirection(.North)
        snakeGame.snakeGameControl.updatePlayerMovements()
        
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
        snakeGame.snakeGameControl.updatePlayerMovements() // (12,6), (12,7), (11,77)
        
        // act
        snakeGame.updateDirection(.East)
        snakeGame.snakeGameControl.updatePlayerMovements()
        
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
        snakeGame.snakeGameControl.updatePlayerMovements() // (12,8), (12,7), (11,7)
        
        // act
        snakeGame.updateDirection(.West)
        snakeGame.snakeGameControl.updatePlayerMovements()
        
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

        snakeGame.snakeGameControl.powerUp = PowerUpElement(cell: grid.position(rowIndex: 13, colIndex: 7)!)

        // act
        snakeGame.snakeGameControl.updatePlayerMovements()

        // assert
        XCTAssertEqual(4, snake.length, "snake should have a length of 4")
        assertSnakeTilePosition(expected: (13,7), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle 1")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "middle 2")
        assertSnakeTilePosition(expected: (10,7), actual: snake.vector[3].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 13, colIndex: 7)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 12, colIndex: 7)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 11, colIndex: 7)!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid.position(rowIndex: 10, colIndex: 7)!.type, "cell type should be of type Empty")
        
        XCTAssertFalse(snakeGame.snakeGameControl.isGameOver, "should not be Game Over")
    }
    
    func test_gameOver_north() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        snakeGame.snakeGameControl.player = Snake(startingCell: grid.position(rowIndex: 24, colIndex: 6)!)
        
        // act
        snakeGame.snakeGameControl.updatePlayerMovements()
        
        // assert
        XCTAssertTrue(snakeGame.snakeGameControl.isGameOver, "should be Game Over")
    }
    
    func test_gameOver_south() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        snakeGame.snakeGameControl.player = Snake(startingCell: grid.position(rowIndex: 2, colIndex: 6)!)
        
        snakeGame.updateDirection(.West)
        snakeGame.snakeGameControl.updatePlayerMovements()
        
        // act
        snakeGame.updateDirection(.South)
        snakeGame.snakeGameControl.updatePlayerMovements()
        snakeGame.snakeGameControl.updatePlayerMovements()
        snakeGame.snakeGameControl.updatePlayerMovements()

        // assert
        XCTAssertTrue(snakeGame.snakeGameControl.isGameOver, "should be Game Over")
    }
    
    func test_gameOver_east() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        snakeGame.snakeGameControl.player = Snake(startingCell: grid.position(rowIndex: 12, colIndex: 14)!)
        
        // act
        snakeGame.updateDirection(.East)
        snakeGame.snakeGameControl.updatePlayerMovements()
        
        // assert
        XCTAssertTrue(snakeGame.snakeGameControl.isGameOver, "should be Game Over")
    }
    
    func test_gameOver_west() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeGameControl.player // (12,7), (11,7), (10,7)
        
        snakeGame.snakeGameControl.player = Snake(startingCell: grid.position(rowIndex: 24, colIndex: 0)!)
        
        // act
        snakeGame.updateDirection(.South)
        snakeGame.snakeGameControl.updatePlayerMovements()
        
        // assert
        XCTAssertTrue(snakeGame.snakeGameControl.isGameOver, "should be Game Over")
    }
    
    //MARK: assert helpers
    
    private func assertSnakeTilePosition(#expected: (row: Int, column: Int), actual: Cell, message: String = "") {
        XCTAssertEqual(expected.row, actual.row, "wrong row (\(message))")
        XCTAssertEqual(expected.column, actual.column, "wrong column (\(message))")
    }
}

