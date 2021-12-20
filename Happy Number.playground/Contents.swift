// https://leetcode.com/problems/happy-number/

import UIKit
import XCTest

class Solution {
    static func isHappy(_ n: Int) -> Bool {
        var n = n
        var set = Set<Int>()
        
        while n != 1 {
            // Split int into individual digits
            let digits = String(n).compactMap { Int(String($0)) }
            
            // Sum the squares of each digit
            var sum = 0
            digits.forEach {
                sum += $0 * $0
            }
            
            // Store the sum in a set so we can check for infinite loop
            if set.contains(sum) {
                // Duplicate detected
                return false
            } else {
                set.insert(sum)
            }
            
            // Continue until sum is one or loop is detected
            n = sum
        }
        
        return true
    }
}

class Tests : XCTestCase {
    func test1() {
        let n = 19
        let answer = true
        
        XCTAssertEqual(Solution.isHappy(n), answer)
    }
    
    func test2() {
        let n = 493
        let answer = false
        
        XCTAssertEqual(Solution.isHappy(n), answer)
    }
    
    func test3() {
        let n = 2947184
        let answer = false
        
        XCTAssertEqual(Solution.isHappy(n), answer)
    }
}

Tests.defaultTestSuite.run()
