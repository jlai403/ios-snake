import snake
import UIKit
import XCTest

class GameGridTests: XCTestCase {
    
    func test_10x10Grid_375x667ViewSize() {
        // assemble
        let viewSize = CGSizeMake(375.0, 667.0)
        let rows = 10
        let columns = 10
        
        // act
        let grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // assert
        XCTAssertEqual(370, grid.width, "wrong grid width")
        XCTAssertEqual(370, grid.height, "wrong grid height")
        XCTAssertEqual(CGSize(width: 37.0, height: 37.0), grid.cellSize, "wrong cell size")
        XCTAssertEqual(100, grid.count, "wrong cell count")
    }
    
    func test_10x20Grid_375x667ViewSize() {
        // assemble
        let viewSize = CGSizeMake(375.0, 667.0)
        let rows = 20
        let columns = 10
        
        // act
        let grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // assert
        XCTAssertEqual(370, grid.width, "wrong grid width")
        XCTAssertEqual(740, grid.height, "wrong grid height")
        XCTAssertEqual(CGSize(width: 37.0, height: 37.0), grid.cellSize, "wrong cell size")
        XCTAssertEqual(200, grid.count, "wrong cell count")
    }
    
    func test_10x20Grid_320x568ViewSize() {
        // assemble
        let viewSize = CGSizeMake(320.0, 568.0)
        let rows = 20
        let columns = 10
        
        // act
        let grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // assert
        XCTAssertEqual(310, grid.width, "wrong grid width")
        XCTAssertEqual(620, grid.height, "wrong grid height")
        XCTAssertEqual(CGSize(width: 31.0, height: 31.0), grid.cellSize, "wrong cell size")
        XCTAssertEqual(200, grid.count, "wrong cell count")
    }
    
    func test_10x20Grid_768x1068ViewSize() {
        // assemble
        let viewSize = CGSizeMake(768.0, 1024.0)
        let rows = 20
        let columns = 10
        
        // act
        let grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // assert
        XCTAssertEqual(760, grid.width, "wrong grid width")
        XCTAssertEqual(1520, grid.height, "wrong grid height")
        XCTAssertEqual(CGSize(width: 76.0, height: 76.0), grid.cellSize, "wrong cell size")
        XCTAssertEqual(200, grid.count, "wrong cell count")
    }
    
    func test_15x25Grid_375x667ViewSize_centerCoordinates() {
        // assemble
        let viewSize = CGSizeMake(375.0, 667.0)
        let rows = 25
        let columns = 15
        
        let grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // act
        let center = grid.center()
        
        // assert
        XCTAssertEqual(7, center.x, "wrong center column")
        XCTAssertEqual(12, center.y, "wrong center row")
        XCTAssertEqual(CGPointMake(168, 288), center.position, "wrong center position")
        
    }
    
    func test_15x25Grid_375x667ViewSize_zeroCoordinates() {
        // assemble
        let viewSize = CGSizeMake(375.0, 667.0)
        let rows = 25
        let columns = 15
        
        let grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // act
        let zeroPosition = grid[0,0]!
            
        // assert
        XCTAssertEqual(0, zeroPosition.x, "wrong center column")
        XCTAssertEqual(0, zeroPosition.y, "wrong center row")
        XCTAssertEqual(CGPointZero, zeroPosition.position, "should be 0,0")
        
    }
    
    func test_15x25Grid_375x667ViewSize_1x1Position() {
        // assemble
        let viewSize = CGSizeMake(375.0, 667.0)
        let rows = 25
        let columns = 15
        
        let grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // act
        let gridPosition = grid[1,1]!
        
        // assert
        XCTAssertEqual(1, gridPosition.x, "wrong center column")
        XCTAssertEqual(1, gridPosition.y, "wrong center row")
        XCTAssertEqual(CGPointMake(24, 24), gridPosition.position, "should be 23,23")
        
    }
}



