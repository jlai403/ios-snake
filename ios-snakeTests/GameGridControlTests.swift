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
        var snake = snakeGame.snakeMechanic.player // (12,7), (11,7), (10,7)

        snakeGame.updateDirection(.North)
    
        // act
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (13,7), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "tail")
    
        XCTAssertEqual(CellType.Snake, grid[13,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[12,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[11,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid[10,7]!.type, "cell type should be of type Empty")
        
        XCTAssertFalse(snakeGame.isGameOver, "should not be Game Over")
    }
    
    func test_moveEast() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeMechanic.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.East)
        
        // act
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (12,8), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid[12,8]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[12,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[11,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid[10,7]!.type, "cell type should be of type Empty")
        
        XCTAssertFalse(snakeGame.isGameOver, "should not be Game Over")
    }
    
    func test_moveWest() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeMechanic.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.West)
        
        // act
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (12,6), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid[12,6]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[12,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[11,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid[10,7]!.type, "cell type should be of type Empty")
        
        XCTAssertFalse(snakeGame.isGameOver, "should not be Game Over")
    }
    
    func test_moveSouth_moveEast2x() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeMechanic.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.East)
        snakeGame.snakeMechanic.updatePlayerPosition() // (12,8), (12,7), (11,7)
        snakeGame.snakeMechanic.updatePlayerPosition() // (12,8), (12,8), (12,7)
        
        snakeGame.updateDirection(.South)

        // act
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (11,9), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,9), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (12,8), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid[11,9]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[12,9]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[12,8]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid[12,7]!.type, "cell type should be of type Empty")
        
        XCTAssertFalse(snakeGame.isGameOver, "should not be Game Over")
    }
    
    func test_updateDirectionSouth_currentDirectionNorth() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeMechanic.player // (12,7), (11,7), (10,7)
        
        // act
        snakeGame.updateDirection(.South)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (13,7), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "tail")
    }
    
    func test_updateDirectionNorth_currentDirectionSouth() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeMechanic.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.West)
        snakeGame.snakeMechanic.updatePlayerPosition()  // (12,6), (12,7), (11,7)

        snakeGame.updateDirection(.South)
        snakeGame.snakeMechanic.updatePlayerPosition() // (11,6), (12,6), (12,7)
        
        // act
        snakeGame.updateDirection(.North)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (10,6), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (11,6), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (12,6), actual: snake.vector[2].cell, message: "tail")
    }
    
    func test_updateDirectionEast_currentDirectionWest() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeMechanic.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.West)
        snakeGame.snakeMechanic.updatePlayerPosition() // (12,6), (12,7), (11,77)
        
        // act
        snakeGame.updateDirection(.East)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (12,5), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,6), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[2].cell, message: "tail")
    }
    
    func test_updateDirectionWest_currentDirectionEast() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeMechanic.player // (12,7), (11,7), (10,7)
        
        snakeGame.updateDirection(.East)
        snakeGame.snakeMechanic.updatePlayerPosition() // (12,8), (12,7), (11,7)
        
        // act
        snakeGame.updateDirection(.West)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (12,9), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,8), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[2].cell, message: "tail")
    }
    
    func test_powerUpPosition() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeMechanic.player // (12,7), (11,7), (10,7)
        
        // act
        var powerUp = snakeGame.snakeMechanic.powerUp
        
        // assert
        XCTAssertNotEqual(powerUp.cell, snake.vector[0].cell, "power up cell position is already taken by snake")
        XCTAssertEqual(powerUp.cell.type, CellType.PowerUp, "cell type should be power up")
    }
    
    func test_consumePowerUp() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeMechanic.player // (12,7), (11,7), (10,7)

        snakeGame.snakeMechanic.powerUp = PowerUpElement(cell: grid[13,7]!)

        // act
        snakeGame.snakeMechanic.updatePlayerPosition()

        // assert
        XCTAssertEqual(1, snakeGame.score, "score should be 1")
        XCTAssertEqual(4, snake.length, "snake should have a length of 4")
        assertSnakeTilePosition(expected: (13,7), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[1].cell, message: "middle 1")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[2].cell, message: "middle 2")
        assertSnakeTilePosition(expected: (10,7), actual: snake.vector[3].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid[13,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[12,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[11,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[10,7]!.type, "cell type should be of type Empty")
        
        XCTAssertFalse(snakeGame.isGameOver, "should not be Game Over")
    }
    
    func test_gameOver_north() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        snakeGame.snakeMechanic.player = Snake(startingCell: grid[24, 6]!)
        
        // act
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        XCTAssertTrue(snakeGame.isGameOver, "should be Game Over")
    }
    
    func test_gameOver_south() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        snakeGame.snakeMechanic.player = Snake(startingCell: grid[2, 6]!)
        
        snakeGame.updateDirection(.West)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // act
        snakeGame.updateDirection(.South)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGame.snakeMechanic.updatePlayerPosition()

        // assert
        XCTAssertTrue(snakeGame.isGameOver, "should be Game Over")
    }
    
    func test_gameOver_east() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeMechanic.player // (12,7), (11,7), (10,7)
        
        snakeGame.snakeMechanic.player = Snake(startingCell: grid[12,14]!)
        
        // act
        snakeGame.updateDirection(.East)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        XCTAssertTrue(snakeGame.isGameOver, "should be Game Over")
    }
    
    func test_gameOver_west() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snake = snakeGame.snakeMechanic.player // (12,7), (11,7), (10,7)
        
        snakeGame.snakeMechanic.player = Snake(startingCell: grid[24,0]!)
        
        // act
        snakeGame.updateDirection(.South)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        XCTAssertTrue(snakeGame.isGameOver, "should be Game Over")
    }
    
    func test_gameOver_snakeInTheWay() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var snakeGameControl = snakeGame.snakeMechanic
        var player = snakeGameControl.player
        
        snakeGameControl.powerUp.setPosition(player.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(player.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // act
        snakeGame.updateDirection(.West)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGame.updateDirection(.South)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGame.updateDirection(.East)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        XCTAssertTrue(snakeGame.isGameOver, "should be Game Over")
    }
    
    func test_resetGame() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snakeGameControl = snakeGame.snakeMechanic
        var snake = snakeGameControl.player
        
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        snakeGame.updateDirection(.West)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGame.updateDirection(.South)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGame.updateDirection(.East)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        XCTAssertTrue(snakeGame.isGameOver, "should be Game Over")
        XCTAssertEqual(2, snakeGame.score, "score should be 2")
        
        // act
        snakeGame.reset()
        
        // assert
        snake = snakeGameControl.player
        XCTAssertEqual(3, snake.length, "Snake length should be 3")
        assertSnakeTilePosition(expected: (12,7), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (11,7), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (10,7), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Empty, grid[13,7]!.type, "cell type should be of type Empty")
        XCTAssertEqual(CellType.Snake, grid[12,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[11,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[10,7]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Empty, grid[9,7]!.type, "cell type should be of type Empty")
        
        XCTAssertFalse(snakeGame.isGameOver, "should not be Game Over")
        XCTAssertEqual(0, snakeGame.score, "score should be 0")
    }
    
    func test_levelUp_2() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snakeGameControl = snakeGame.snakeMechanic
        var snake = snakeGameControl.player
        
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)

        
        // act
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        XCTAssertEqual(2, snakeGame.currentLevel(), "current level should be 2")
    }
    
    func test_levelUp_3() {
        // assemble
        var snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        var grid = snakeGame.grid
        var snakeGameControl = snakeGame.snakeMechanic
        var snake = snakeGameControl.player
        
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        snakeGameControl.updateDirection(.West)
        
        snakeGameControl.powerUp.setPosition(snake.head.cell.west()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.west()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.west()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.west()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // act
        snakeGameControl.powerUp.setPosition(snake.head.cell.west()!)
        snakeGame.snakeMechanic.updatePlayerPosition()
        
        // assert
        XCTAssertEqual(3, snakeGame.currentLevel(), "current level should be 3")
    }
    
    //MARK: assert helpers
    
    private func assertSnakeTilePosition(#expected: (row: Int, column: Int), actual: Cell, message: String = "") {
        XCTAssertEqual(expected.row, actual.row, "wrong row (\(message))")
        XCTAssertEqual(expected.column, actual.column, "wrong column (\(message))")
    }
}

