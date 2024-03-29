import snake
import UIKit
import XCTest

class SnakeGameTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        ScoreboardManager.sharedInstance = DoNothingScoreboardManager()
    }
    
    override func tearDown() {
        super.tearDown()
        ScoreboardManager.sharedInstance = ScoreboardManager()
    }
    
    func test_moveNorth() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        let snake = snakeGame.gameMechanic.player // (7,12), (7,11), (10,7)
        snakeGame.gameMechanic.powerUp.setPosition(grid[14,24]!)
        
        snakeGame.updateDirection(.North)
    
        // act
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (7,13), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (7,12), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (7,11), actual: snake.vector[2].cell, message: "tail")
    
        XCTAssertEqual(CellType.Snake, grid[7,13]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[7,12]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[7,11]!.type, "cell type should be of type Snake")
        XCTAssertNotEqual(CellType.Snake, grid[7,10]!.type, "cell type should not be of type Snake")
        
        XCTAssertFalse(snakeGame.isGameOver, "should not be Game Over")
    }
    
    func test_moveEast() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        let snake = snakeGame.gameMechanic.player // (7,12), (7,11), (10,7)
        snakeGame.gameMechanic.powerUp.setPosition(grid[14,24]!)
        
        snakeGame.updateDirection(.East)
        
        // act
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (8,12), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (7,12), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (7,11), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid[8,12]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[7,12]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[7,11]!.type, "cell type should be of type Snake")
        XCTAssertNotEqual(CellType.Snake, grid[7,10]!.type, "cell type should not be of type Snake")
        
        XCTAssertFalse(snakeGame.isGameOver, "should not be Game Over")
    }
    
    func test_moveWest() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        let snake = snakeGame.gameMechanic.player // (7,12), (7,11), (10,7)
        snakeGame.gameMechanic.powerUp.setPosition(grid[14,24]!)
        
        snakeGame.updateDirection(.West)
        
        // act
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (6,12), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (7,12), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (7,11), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid[6,12]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[7,12]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[7,11]!.type, "cell type should be of type Snake")
        XCTAssertNotEqual(CellType.Snake, grid[7,10]!.type, "cell type should not be of type Snake")
        
        XCTAssertFalse(snakeGame.isGameOver, "should not be Game Over")
    }
    
    func test_moveSouth_moveEast2x() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        let snake = snakeGame.gameMechanic.player // (7,12), (7,11), (10,7)
        snakeGame.gameMechanic.powerUp.setPosition(grid[14,24]!)
        
        snakeGame.updateDirection(.East)
        snakeGame.gameMechanic.updatePlayerPosition() // (12,8), (7,12), (7,11)
        snakeGame.gameMechanic.updatePlayerPosition() // (12,8), (12,8), (7,12)
        
        snakeGame.updateDirection(.South)

        // act
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (9,11), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (9,12), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (8,12), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid[9,11]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[9,12]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[8,12]!.type, "cell type should be of type Snake")
        XCTAssertNotEqual(CellType.Snake, grid[7,12]!.type, "cell type should not be of type Snake")
        
        XCTAssertFalse(snakeGame.isGameOver, "should not be Game Over")
    }
    
    func test_updateDirectionSouth_currentDirectionNorth() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        let snake = snakeGame.gameMechanic.player // (7,12), (7,11), (10,7)
        snakeGame.gameMechanic.powerUp.setPosition(grid[14,24]!)
        
        // act
        snakeGame.updateDirection(.South)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (7,13), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (7,12), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (7,11), actual: snake.vector[2].cell, message: "tail")
    }
    
    func test_updateDirectionNorth_currentDirectionSouth() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        let snake = snakeGame.gameMechanic.player // (7,12), (7,11), (10,7)
        snakeGame.gameMechanic.powerUp.setPosition(grid[14,24]!)
        
        snakeGame.updateDirection(.West)
        snakeGame.gameMechanic.updatePlayerPosition()  // (12,6), (7,12), (7,11)

        snakeGame.updateDirection(.South)
        snakeGame.gameMechanic.updatePlayerPosition() // (11,6), (12,6), (7,12)
        
        // act
        snakeGame.updateDirection(.North)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (6,10), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (6,11), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (6,12), actual: snake.vector[2].cell, message: "tail")
    }
    
    func test_updateDirectionEast_currentDirectionWest() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        let snake = snakeGame.gameMechanic.player // (7,12), (7,11), (10,7)
        snakeGame.gameMechanic.powerUp.setPosition(grid[14,24]!)
        
        snakeGame.updateDirection(.West)
        snakeGame.gameMechanic.updatePlayerPosition() // (12,6), (7,12), (7,117)
        
        // act
        snakeGame.updateDirection(.East)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (5,12), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (6,12), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (7,12), actual: snake.vector[2].cell, message: "tail")
    }
    
    func test_updateDirectionWest_currentDirectionEast() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        let snake = snakeGame.gameMechanic.player // (7,12), (7,11), (10,7)
        snakeGame.gameMechanic.powerUp.setPosition(grid[14,24]!)
        
        snakeGame.updateDirection(.East)
        snakeGame.gameMechanic.updatePlayerPosition() // (12,8), (7,12), (7,11)
        
        // act
        snakeGame.updateDirection(.West)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        assertSnakeTilePosition(expected: (9,12), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (8,12), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (7,12), actual: snake.vector[2].cell, message: "tail")
    }
    
    func test_powerUpPosition() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let snake = snakeGame.gameMechanic.player // (7,12), (7,11), (10,7)
        
        // act
        let powerUp = snakeGame.gameMechanic.powerUp
        
        // assert
        XCTAssertNotEqual(powerUp.cell, snake.vector[0].cell, "power up cell position is already taken by snake")
        XCTAssertEqual(powerUp.cell.type, CellType.PowerUp, "cell type should be power up")
    }
    
    func test_consumePowerUp() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        let snake = snakeGame.gameMechanic.player // (7,12), (7,11), (10,7)

        snakeGame.gameMechanic.powerUp = PowerUpNode(cell: grid[7,13]!)

        // act
        snakeGame.gameMechanic.updatePlayerPosition()

        // assert
        XCTAssertEqual(1, snakeGame.score, "score should be 1")
        XCTAssertEqual(4, snake.length, "snake should have a length of 4")
        assertSnakeTilePosition(expected: (7,13), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (7,12), actual: snake.vector[1].cell, message: "middle 1")
        assertSnakeTilePosition(expected: (7,11), actual: snake.vector[2].cell, message: "middle 2")
        assertSnakeTilePosition(expected: (7,10), actual: snake.vector[3].cell, message: "tail")
        
        XCTAssertEqual(CellType.Snake, grid[7,13]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[7,12]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[7,11]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[7,10]!.type, "cell type should be of type Snake")
        
        XCTAssertFalse(snakeGame.isGameOver, "should not be Game Over")
    }
    
    func test_gameOver_north() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        snakeGame.gameMechanic.player = Snake(startingCell: grid[6,24]!)
        
        // act
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        XCTAssertTrue(snakeGame.isGameOver, "should be Game Over")
    }
    
    func test_gameOver_south() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        snakeGame.gameMechanic.player = Snake(startingCell: grid[6,2]!)
        
        snakeGame.updateDirection(.West)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // act
        snakeGame.updateDirection(.South)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGame.gameMechanic.updatePlayerPosition()

        // assert
        XCTAssertTrue(snakeGame.isGameOver, "should be Game Over")
    }
    
    func test_gameOver_east() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        
        snakeGame.gameMechanic.player = Snake(startingCell: grid[14,12]!)
        
        // act
        snakeGame.updateDirection(.East)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        XCTAssertTrue(snakeGame.isGameOver, "should be Game Over")
    }
    
    func test_gameOver_west() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        
        snakeGame.gameMechanic.player = Snake(startingCell: grid[0,24]!)
        
        // act
        snakeGame.updateDirection(.South)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        XCTAssertTrue(snakeGame.isGameOver, "should be Game Over")
    }
    
    func test_gameOver_snakeInTheWay() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let snakeGameControl = snakeGame.gameMechanic
        let player = snakeGameControl.player
        
        snakeGameControl.powerUp.setPosition(player.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(player.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // act
        snakeGame.updateDirection(.West)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGame.updateDirection(.South)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGame.updateDirection(.East)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        XCTAssertTrue(snakeGame.isGameOver, "should be Game Over")
    }
    
    func test_resetGame() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let grid = snakeGame.grid
        let snakeGameControl = snakeGame.gameMechanic
        var snake = snakeGameControl.player
        snakeGame.gameMechanic.powerUp.setPosition(grid[14,24]!)
        
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        snakeGame.updateDirection(.West)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGame.updateDirection(.South)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGame.updateDirection(.East)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        XCTAssertTrue(snakeGame.isGameOver, "should be Game Over")
        XCTAssertEqual(2, snakeGame.score, "score should be 2")
        
        // act
        snakeGame.reset()
        
        // assert
        snake = snakeGameControl.player
        XCTAssertEqual(3, snake.length, "Snake length should be 3")
        assertSnakeTilePosition(expected: (7,12), actual: snake.vector[0].cell, message: "head")
        assertSnakeTilePosition(expected: (7,11), actual: snake.vector[1].cell, message: "middle")
        assertSnakeTilePosition(expected: (7,10), actual: snake.vector[2].cell, message: "tail")
        
        XCTAssertNotEqual(CellType.Snake, grid[7,13]!.type, "cell type should not be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[7,12]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[7,11]!.type, "cell type should be of type Snake")
        XCTAssertEqual(CellType.Snake, grid[7,10]!.type, "cell type should be of type Snake")
        XCTAssertNotEqual(CellType.Snake, grid[7,9]!.type, "cell type should not be of type Snake")
        
        XCTAssertFalse(snakeGame.isGameOver, "should not be Game Over")
        XCTAssertEqual(0, snakeGame.score, "score should be 0")
    }
    
    func test_levelUp_2() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let snakeGameControl = snakeGame.gameMechanic
        let snake = snakeGameControl.player
        
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)

        
        // act
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        XCTAssertEqual(2, snakeGame.currentLevel(), "current level should be 2")
    }
    
    func test_levelUp_3() {
        // assemble
        let snakeGame = SnakeGame(gameViewSize: CGSizeMake(375.0, 667.0), rows: 25, columns: 15)
        let snakeGameControl = snakeGame.gameMechanic
        let snake = snakeGameControl.player
        
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.north()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        snakeGameControl.updateDirection(.West)
        
        snakeGameControl.powerUp.setPosition(snake.head.cell.west()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.west()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.west()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        snakeGameControl.powerUp.setPosition(snake.head.cell.west()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // act
        snakeGameControl.powerUp.setPosition(snake.head.cell.west()!)
        snakeGame.gameMechanic.updatePlayerPosition()
        
        // assert
        XCTAssertEqual(3, snakeGame.currentLevel(), "current level should be 3")
    }
    
    //MARK: assert helpers
    
    private func assertSnakeTilePosition(expected expected: (x: Int, y: Int), actual: Cell, message: String = "") {
        XCTAssertEqual(expected.x, actual.x, "wrong column (\(message))")
        XCTAssertEqual(expected.y, actual.y, "wrong row (\(message))")
    }
}
