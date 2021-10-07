// https://leetcode.com/problems/merge-intervals/

import UIKit
import XCTest

class Solution {
    static func merge(_ intervals: [[Int]]) -> [[Int]] {
        // If empty array is passed in, return empty array
        guard !intervals.isEmpty else { return intervals }
        
        // Sort intervals by start time
        let sorted = intervals.sorted { $0[0] < $1[0] }
        
        var results = [sorted[0]]
        
        // Store results in a stack
        //  Start with intervals[0] in the stack
        //  Iterate through intervals and compare intervals[i] with the last value in the stack
        //      If intervals[i] is within the timespan of the stack value, merge values and add to stack
        for i in 1..<sorted.count {
            let current = sorted[i]
            let last = results.removeLast()
            
            // If current starts before last ends, create new interval
            if (current[0] <= last[1]) {
                let newInterval = [
                    min(current[0],last[0]),
                    max(current[1],last[1])
                ]
                
                results.append(newInterval)
            } else {
                results.append(last)
                results.append(current)
            }
        }
        
        return results
    }
}

class Tests : XCTestCase {
    func test1() {
        let intervals = [[1,3],[2,6],[8,10],[15,18]]
        let answer = [[1,6],[8,10],[15,18]]
        
        XCTAssertEqual(Solution.merge(intervals), answer)
    }
    
    func test2() {
        let intervals = [[1,4],[4,5]]
        let answer = [[1,5]]
        
        XCTAssertEqual(Solution.merge(intervals), answer)
    }
    
    func test3() {
        let intervals = [[Int]]()
        let answer = [[Int]]()
        
        XCTAssertEqual(Solution.merge(intervals), answer)
    }
}

Tests.defaultTestSuite.run()
