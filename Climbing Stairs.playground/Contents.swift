// https://leetcode.com/problems/climbing-stairs/

import UIKit
import XCTest

class Solution {
    // Approach:
    // This problem can be broken down into subproblems
    // For example, starting at height n, the number of ways to get to n from n is 0
    // Then for n-1, the number of ways to get to n is 1
    // For n-2, the number of ways to get to n is the sum of ways to get there from n-1 and n
    // Continue until you get to 0
    
    // Runtime: O(n)
    // Space: O(1)
    static func climbStairs(_ n: Int) -> Int {
        // Handle base case
        if n <= 1 {
            return 1
        }
        
        // Improve v1 by replacing array with variables since we only need the last two values
        var n1 = 1
        var n2 = 1
        var current = 0
        
        // We can also improve runtime by removing reversed()
        for _ in (2...n) {
            current = n1 + n2
            n2 = n1
            n1 = current
        }
        
        return current
    }
    
    
    // Runtime: O(n)
    // Space: O(n)
    static func climbStairsVersion1(_ n: Int) -> Int {
        // Handle base case
        if n <= 1 {
            return 1
        }
        
        // Set to all 1s to handle base cases for n and n-1
        var dp = [Int](repeating: 1, count: n+1)
        
        // Start at the end and work backwards
        for i in (0...n-2).reversed() {
            dp[i] = dp[i+1] + dp[i+2]
        }
        
        return dp[0]
    }
}

class Tests : XCTestCase {
    func test1() {
        let n = 5
        let answer = 8
        
        XCTAssertEqual(Solution.climbStairs(n), answer)
    }

    func test2() {
        let n = 2
        let answer = 2
        
        XCTAssertEqual(Solution.climbStairs(n), answer)
    }

    func test3() {
        let n = 1
        let answer = 1
        
        XCTAssertEqual(Solution.climbStairs(n), answer)
    }
    
    func test4() {
        let n = 1
        let answer = 1
        
        XCTAssertEqual(Solution.climbStairs(n), answer)
    }
}

Tests.defaultTestSuite.run()
