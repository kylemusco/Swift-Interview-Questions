// https://leetcode.com/problems/pascals-triangle/

import UIKit
import XCTest

class Solution {
    static func generate(_ numRows: Int) -> [[Int]] {
        var rows = [[1]]
        
        // Handle edge case
        if numRows < 1 {
            return rows
        }
        
        for i in 1..<numRows {
            // Each row starts and ends with 1
            var newRow = [Int].init(repeating: 0, count: i+1)
            newRow[0] = 1
            newRow[newRow.count-1] = 1
            
            // Calculate the next row by adding the left and right values from the last row
            let lastRow = rows[i-1]
            for j in 1..<lastRow.count {
                newRow[j] = lastRow[j-1] + lastRow[j]
            }
            
            rows.append(newRow)
        }
        
        return rows
    }
}

class Tests : XCTestCase {
    func test1() {
        let numRows = 0
        let answer = [[1]]
        
        XCTAssertEqual(Solution.generate(numRows), answer)
    }
    
    func test2() {
        let numRows = 3
        let answer = [[1],[1,1],[1,2,1]]
        
        XCTAssertEqual(Solution.generate(numRows), answer)
    }
    
    func test3() {
        let numRows = 5
        let answer = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
        
        XCTAssertEqual(Solution.generate(numRows), answer)
    }
}

Tests.defaultTestSuite.run()
