// https://leetcode.com/problems/pascals-triangle-ii/

import UIKit
import XCTest

class Solution {
    // Runtime: O(n^2)
    // Space: O(n)
    static func getRow(_ rowIndex: Int) -> [Int] {
        var lastRow = [1]
        
        for i in 0...rowIndex {
            // Each row starts and ends with 1
            var newRow = [Int].init(repeating: 0, count: i+1)
            newRow[0] = 1
            newRow[newRow.count-1] = 1
            
            for j in 1..<lastRow.count {
                newRow[j] = lastRow[j-1] + lastRow[j]
            }
            
            lastRow = newRow
        }
        
        return lastRow
    }
}

class Tests : XCTestCase {
    func test1() {
        let numRows = 0
        let answer = [1]
        
        XCTAssertEqual(Solution.getRow(numRows), answer)
    }
    
    func test2() {
        let numRows = 3
        let answer = [1,3,3,1]
        
        XCTAssertEqual(Solution.getRow(numRows), answer)
    }
    
    func test3() {
        let numRows = 1
        let answer = [1,1]
        
        XCTAssertEqual(Solution.getRow(numRows), answer)
    }
}

Tests.defaultTestSuite.run()
