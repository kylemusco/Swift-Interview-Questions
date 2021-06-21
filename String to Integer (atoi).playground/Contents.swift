// https://leetcode.com/problems/string-to-integer-atoi/
// Leetcode submission does not support Swift :(

import Foundation
import XCTest

class Solution {
    public static func myAtoi(_ s: String) -> Int32 {
        // Trim whitespace and convert to an Array so it's easier to access characters by index
        let str = Array(s.trimmingCharacters(in: CharacterSet(charactersIn: " ")))
        
        // Check if first char contains negative sign
        let isNegative = str[0] == "-"
        
        // Iterate through chars in "s", convert to int if possible
        var sum: Int32 = 0
        for i in 0..<str.count {
            if isNegative && i == 0 {
                continue
            }
            
            // We will multiply sum by 10 then add the next char if it can be parsed to an int
            if let char = Int(String(str[i])) {
                // Check for int overflow. Lucky for us, Swift comes with support for this
                // multipledReportingOverflow returns (partialValue: Int32, overflow: Bool)
                let multiplicationResult = sum.multipliedReportingOverflow(by: 10)
                if multiplicationResult.overflow {
                    return isNegative ? Int32.min : Int32.max
                }
                
                sum = multiplicationResult.partialValue
                
                // Check for int overflow again
                let additionResult = sum.addingReportingOverflow(Int32(char))
                if additionResult.overflow {
                    return isNegative ? Int32.min : Int32.max
                }
                
                sum = additionResult.partialValue
            } else if i==0 {
                // Handles case where there are leading non-numeric characters
                return 0
            }
        }
        
        // Check if number is negative. If it is, multiply by -1 and check for overflow
        if isNegative {
            let negativeResult = sum.multipliedReportingOverflow(by: -1)
            return negativeResult.overflow ? Int32.min : sum * -1
        }
        
        return sum
    }
}

class Tests: XCTestCase {
    func test1() {
        let s = "123"
        let answer: Int32 = 123

        XCTAssertEqual(Solution.myAtoi(s), answer)
    }

    func test2() {
        let s = "-123"
        let answer: Int32 = -123

        XCTAssertEqual(Solution.myAtoi(s), answer)
    }
    
    func test3() {
        let s = "-91283472332"
        let answer: Int32 = -2147483648
        
        XCTAssertEqual(Solution.myAtoi(s), answer)
    }
    
    func test4() {
        let s = "        -123"
        let answer: Int32 = -123

        XCTAssertEqual(Solution.myAtoi(s), answer)
    }
    
    func test5() {
        let s = "4193 with words"
        let answer: Int32 = 4193

        XCTAssertEqual(Solution.myAtoi(s), answer)
    }
    
    func test6() {
        let s = "words and 987"
        let answer: Int32 = 0

        XCTAssertEqual(Solution.myAtoi(s), answer)
    }
}

Tests.defaultTestSuite.run()
