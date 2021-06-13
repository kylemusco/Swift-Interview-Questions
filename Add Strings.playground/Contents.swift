// https://leetcode.com/problems/add-strings/

import UIKit
import XCTest

class Solution {
    // Runtime: O(max(N,M)) Where N and M are lengths of num1 and num2
    // Memory: O(n)
    public static func addStrings(_ num1: String, _ num2: String) -> String {
        let n1 = Array(num1)
        let n2 = Array(num2)
        
        // Point to end of each string
        var p1 = num1.count-1
        var p2 = num2.count-1
        
        // Maintain carry variable if sum of two ints > 10
        var carry = 0
        var res = ""
        
        // Iterate through each character, starting at the end
        while (p1 >= 0 || p2 >= 0) {
            // Convert char to int
            let c1 = p1 >= 0 ? n1[p1].wholeNumberValue! : 0
            let c2 = p2 >= 0 ? n2[p2].wholeNumberValue! : 0
            
            let sum = (c1 + c2 + carry) % 10
            res = String(sum) + res
            
            // Update carry variable
            carry = (c1 + c2 + carry) / 10
            
            // Decrement pointers
            p1 -= 1
            p2 -= 1
        }
        
        if carry > 0 {
            res = String(carry) + res
        }
        
        return res
    }
}

class Tests : XCTestCase {
    func test1() {
        let num1 = "123"
        let num2 = "11"
        let answer = "134"
        
        XCTAssertEqual(Solution.addStrings(num1, num2), answer)
    }
    
    func test2() {
        let num1 = "999"
        let num2 = "999"
        let answer = "1998"
        
        XCTAssertEqual(Solution.addStrings(num1, num2), answer)
    }
}

Tests.defaultTestSuite.run()
