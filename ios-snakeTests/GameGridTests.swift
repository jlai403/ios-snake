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
        var grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // assert
        XCTAssertEqual(350, grid.width, "wrong grid width")
        XCTAssertEqual(350, grid.height, "wrong grid height")
        XCTAssertEqual(CGSize(width: 35.0, height: 35.0), grid.tileSize, "wrong tile size floor(325/10)")
        XCTAssertEqual(10, grid.tiles.count, "wrong row count")
        XCTAssertEqual(10, grid.tiles[0].count, "wrong column count for row 1")
        XCTAssertEqual(10, grid.tiles[1].count, "wrong column count for row 2")
        XCTAssertEqual(10, grid.tiles[2].count, "wrong column count for row 3")
        XCTAssertEqual(10, grid.tiles[3].count, "wrong column count for row 4")
        XCTAssertEqual(10, grid.tiles[4].count, "wrong column count for row 5")
        XCTAssertEqual(10, grid.tiles[5].count, "wrong column count for row 6")
        XCTAssertEqual(10, grid.tiles[6].count, "wrong column count for row 7")
        XCTAssertEqual(10, grid.tiles[7].count, "wrong column count for row 8")
        XCTAssertEqual(10, grid.tiles[8].count, "wrong column count for row 9")
        XCTAssertEqual(10, grid.tiles[9].count, "wrong column count for row 10")
    }
    
    func test_10x20Grid_375x667ViewSize() {
        // assemble
        let viewSize = CGSizeMake(375.0, 667.0)
        let rows = 20
        let columns = 10
        
        // act
        var grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // assert
        XCTAssertEqual(350, grid.width, "wrong grid width")
        XCTAssertEqual(700, grid.height, "wrong grid height")
        XCTAssertEqual(CGSize(width: 35.0, height: 35.0), grid.tileSize, "wrong tile size")
        XCTAssertEqual(20, grid.tiles.count, "wrong row count")
        XCTAssertEqual(10, grid.tiles[0].count, "wrong column count for row 1")
        XCTAssertEqual(10, grid.tiles[1].count, "wrong column count for row 2")
        XCTAssertEqual(10, grid.tiles[2].count, "wrong column count for row 3")
        XCTAssertEqual(10, grid.tiles[3].count, "wrong column count for row 4")
        XCTAssertEqual(10, grid.tiles[4].count, "wrong column count for row 5")
        XCTAssertEqual(10, grid.tiles[5].count, "wrong column count for row 6")
        XCTAssertEqual(10, grid.tiles[6].count, "wrong column count for row 7")
        XCTAssertEqual(10, grid.tiles[7].count, "wrong column count for row 8")
        XCTAssertEqual(10, grid.tiles[8].count, "wrong column count for row 9")
        XCTAssertEqual(10, grid.tiles[9].count, "wrong column count for row 10")
        XCTAssertEqual(10, grid.tiles[10].count, "wrong column count for row 11")
        XCTAssertEqual(10, grid.tiles[11].count, "wrong column count for row 12")
        XCTAssertEqual(10, grid.tiles[12].count, "wrong column count for row 13")
        XCTAssertEqual(10, grid.tiles[13].count, "wrong column count for row 14")
        XCTAssertEqual(10, grid.tiles[14].count, "wrong column count for row 15")
        XCTAssertEqual(10, grid.tiles[15].count, "wrong column count for row 16")
        XCTAssertEqual(10, grid.tiles[16].count, "wrong column count for row 17")
        XCTAssertEqual(10, grid.tiles[17].count, "wrong column count for row 18")
        XCTAssertEqual(10, grid.tiles[18].count, "wrong column count for row 19")
        XCTAssertEqual(10, grid.tiles[19].count, "wrong column count for row 20")
    }
    
    func test_10x20Grid_320x568ViewSize() {
        // assemble
        let viewSize = CGSizeMake(320.0, 568.0)
        let rows = 20
        let columns = 10
        
        // act
        var grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // assert
        XCTAssertEqual(300, grid.width, "wrong grid width")
        XCTAssertEqual(600, grid.height, "wrong grid height")
        XCTAssertEqual(CGSize(width: 30.0, height: 30.0), grid.tileSize, "wrong tile size")
        XCTAssertEqual(20, grid.tiles.count, "wrong row count")
        XCTAssertEqual(10, grid.tiles[0].count, "wrong column count for row 1")
        XCTAssertEqual(10, grid.tiles[1].count, "wrong column count for row 2")
        XCTAssertEqual(10, grid.tiles[2].count, "wrong column count for row 3")
        XCTAssertEqual(10, grid.tiles[3].count, "wrong column count for row 4")
        XCTAssertEqual(10, grid.tiles[4].count, "wrong column count for row 5")
        XCTAssertEqual(10, grid.tiles[5].count, "wrong column count for row 6")
        XCTAssertEqual(10, grid.tiles[6].count, "wrong column count for row 7")
        XCTAssertEqual(10, grid.tiles[7].count, "wrong column count for row 8")
        XCTAssertEqual(10, grid.tiles[8].count, "wrong column count for row 9")
        XCTAssertEqual(10, grid.tiles[9].count, "wrong column count for row 10")
        XCTAssertEqual(10, grid.tiles[10].count, "wrong column count for row 11")
        XCTAssertEqual(10, grid.tiles[11].count, "wrong column count for row 12")
        XCTAssertEqual(10, grid.tiles[12].count, "wrong column count for row 13")
        XCTAssertEqual(10, grid.tiles[13].count, "wrong column count for row 14")
        XCTAssertEqual(10, grid.tiles[14].count, "wrong column count for row 15")
        XCTAssertEqual(10, grid.tiles[15].count, "wrong column count for row 16")
        XCTAssertEqual(10, grid.tiles[16].count, "wrong column count for row 17")
        XCTAssertEqual(10, grid.tiles[17].count, "wrong column count for row 18")
        XCTAssertEqual(10, grid.tiles[18].count, "wrong column count for row 19")
        XCTAssertEqual(10, grid.tiles[19].count, "wrong column count for row 20")
    }
    
    func test_10x20Grid_768x1068ViewSize() {
        // assemble
        let viewSize = CGSizeMake(768.0, 1024.0)
        let rows = 20
        let columns = 10
        
        // act
        var grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // assert
        XCTAssertEqual(740, grid.width, "wrong grid width")
        XCTAssertEqual(1480, grid.height, "wrong grid height")
        XCTAssertEqual(CGSize(width: 74.0, height: 74.0), grid.tileSize, "wrong tile size floor")
        XCTAssertEqual(20, grid.tiles.count, "wrong row count")
        XCTAssertEqual(10, grid.tiles[0].count, "wrong column count for row 1")
        XCTAssertEqual(10, grid.tiles[1].count, "wrong column count for row 2")
        XCTAssertEqual(10, grid.tiles[2].count, "wrong column count for row 3")
        XCTAssertEqual(10, grid.tiles[3].count, "wrong column count for row 4")
        XCTAssertEqual(10, grid.tiles[4].count, "wrong column count for row 5")
        XCTAssertEqual(10, grid.tiles[5].count, "wrong column count for row 6")
        XCTAssertEqual(10, grid.tiles[6].count, "wrong column count for row 7")
        XCTAssertEqual(10, grid.tiles[7].count, "wrong column count for row 8")
        XCTAssertEqual(10, grid.tiles[8].count, "wrong column count for row 9")
        XCTAssertEqual(10, grid.tiles[9].count, "wrong column count for row 10")
        XCTAssertEqual(10, grid.tiles[10].count, "wrong column count for row 11")
        XCTAssertEqual(10, grid.tiles[11].count, "wrong column count for row 12")
        XCTAssertEqual(10, grid.tiles[12].count, "wrong column count for row 13")
        XCTAssertEqual(10, grid.tiles[13].count, "wrong column count for row 14")
        XCTAssertEqual(10, grid.tiles[14].count, "wrong column count for row 15")
        XCTAssertEqual(10, grid.tiles[15].count, "wrong column count for row 16")
        XCTAssertEqual(10, grid.tiles[16].count, "wrong column count for row 17")
        XCTAssertEqual(10, grid.tiles[17].count, "wrong column count for row 18")
        XCTAssertEqual(10, grid.tiles[18].count, "wrong column count for row 19")
        XCTAssertEqual(10, grid.tiles[19].count, "wrong column count for row 20")
    }
    
    func test_15x25Grid_375x667ViewSize_centerCoordinates() {
        // assemble
        let viewSize = CGSizeMake(375.0, 667.0)
        let rows = 25
        let columns = 15
        
        var grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // act
        var center = grid.center()
        
        // assert
        XCTAssertEqual(7, center.x, "wrong center x")
        XCTAssertEqual(12, center.y, "wrong center y")
        XCTAssertEqual(CGPointMake(161, 276), center.position, "wrong center position")
        
    }
    
    func test_15x25Grid_375x667ViewSize_zeroCoordinates() {
        // assemble
        let viewSize = CGSizeMake(375.0, 667.0)
        let rows = 25
        let columns = 15
        
        var grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // act
        var zeroPosition = grid.position(x: 0, y: 0)
            
        // assert
        XCTAssertEqual(0, zeroPosition.x, "wrong center x")
        XCTAssertEqual(0, zeroPosition.y, "wrong center y")
        XCTAssertEqual(CGPointZero, zeroPosition.position, "should be 0,0")
        
    }
    
    func test_15x25Grid_375x667ViewSize_1x1Position() {
        // assemble
        let viewSize = CGSizeMake(375.0, 667.0)
        let rows = 25
        let columns = 15
        
        var grid = GridGenerator.createGrid(viewSize: viewSize, rows: rows, columns: columns)
        
        // act
        var gridPosition = grid.position(x: 1, y: 1)
        
        // assert
        XCTAssertEqual(1, gridPosition.x, "wrong center x")
        XCTAssertEqual(1, gridPosition.y, "wrong center y")
        XCTAssertEqual(CGPointMake(23, 23), gridPosition.position, "should be 23,23")
        
    }
}



