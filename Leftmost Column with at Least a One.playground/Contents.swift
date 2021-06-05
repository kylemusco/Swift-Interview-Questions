// https://leetcode.com/problems/leftmost-column-with-at-least-a-one/
import Foundation
import XCTest

class Solution {
    // Runtime: O(N+M) where N = # rows and M = # cols
    // Memory: O(1)
    public static func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        
        // Since each row is sorted, start at top right and keep moving left if a 1 is found
        //  If a 0 is found, move down
        
        // Find top right index
        let dimensions = binaryMatrix.dimensions()
        var row = 0
        var col = dimensions[1]-1
        
        // Set default answer to -1 if no solution is found
        var indexOfLastOne = -1
        
        // Iterate while within bounds of matrix
        while (row < dimensions[0] && col >= 0) {
            // If 1, update index of last one found and move left
            if (binaryMatrix.get(row, col) == 1) {
                indexOfLastOne = col
                col -= 1
                
            // If 0, move down
            } else {
                row += 1
            }
        }
        
        return indexOfLastOne
    }
}

class Tests : XCTestCase {
    func test1() {
        let mat = BinaryMatrix.init(mat: [[0,0],[1,1]])
        let answer = 0
        
        XCTAssertEqual(Solution.leftMostColumnWithOne(mat), answer)
    }
    
    func test2() {
        let mat = BinaryMatrix.init(mat: [[0,0],[0,1]])
        let answer = 1
        
        XCTAssertEqual(Solution.leftMostColumnWithOne(mat), answer)
    }
    
    func test3() {
        let mat = BinaryMatrix.init(mat: [[0,0],[0,0]])
        let answer = -1
        
        XCTAssertEqual(Solution.leftMostColumnWithOne(mat), answer)
    }
    
    func test4() {
        let mat = BinaryMatrix.init(mat: [[0,0,0,1],[0,0,1,1],[0,1,1,1]])
        let answer = 1
        
        XCTAssertEqual(Solution.leftMostColumnWithOne(mat), answer)
    }
    
    func test5() {
        let mat = BinaryMatrix.init(mat:[[1,1,1,1,1],[0,0,0,1,1],[0,0,1,1,1],[0,0,0,0,1],[0,0,0,0,0]])
        let answer = 0
        
        XCTAssertEqual(Solution.leftMostColumnWithOne(mat), answer)
    }
    
    func test6() {
        let mat = BinaryMatrix.init(mat:[[1]])
        let answer = 0
        
        XCTAssertEqual(Solution.leftMostColumnWithOne(mat), answer)
    }
    
    func test7() {
        let mat = BinaryMatrix.init(mat:[[0]])
        let answer = -1
        
        XCTAssertEqual(Solution.leftMostColumnWithOne(mat), answer)
    }
    
}

Tests.defaultTestSuite.run()
