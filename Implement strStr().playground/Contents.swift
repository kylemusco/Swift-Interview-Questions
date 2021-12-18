// https://leetcode.com/problems/implement-strstr/

import UIKit
import XCTest

class Solution {
    static func strStr(_ haystack: String, _ needle: String) -> Int {
        // if empty string, return 0
        if needle.count == 0 {
            return 0
        }
        
        // Approach:
        // Treat haystack and needle as arrays
        // Iterate through each character in the haystack and compare with first index of needle
        // If there's a match, compare the next character with the next in needle
        // If entire needle is found, return starting index
        
        let haystack = Array(haystack)
        let needle = Array(needle)
        
        for index in 0..<haystack.count {
            // If there's a match, check if the rest of the needle exists
            if haystack[index] == needle[0] {
                var i = index+1
                var fullMatch = true
                for idx in 1..<needle.count {
                    // Check for overflow, then check for match
                    if i > haystack.count-1 || haystack[i] != needle[idx] {
                        fullMatch = false
                        break
                    }
                    
                    i += 1
                }
                
                if fullMatch {
                    return index
                }
            }
        }
        
        // If needle is not found, return -1
        return -1
    }
}

class Tests : XCTestCase {
    func test1() {
        let needle = "a"
        let haystack = "soda"
        let answer = 3

        XCTAssertEqual(Solution.strStr(haystack,needle), answer)
    }

    func test2() {
        let needle = "s"
        let haystack = "soda"
        let answer = 0

        XCTAssertEqual(Solution.strStr(haystack,needle), answer)
    }

    func test3() {
        let needle = "sod"
        let haystack = "soda"
        let answer = 0

        XCTAssertEqual(Solution.strStr(haystack,needle), answer)
    }

    func test4() {
        let needle = "da"
        let haystack = "soda"
        let answer = 2

        XCTAssertEqual(Solution.strStr(haystack,needle), answer)
    }

    func test5() {
        let needle = ""
        let haystack = "soda"
        let answer = 0

        XCTAssertEqual(Solution.strStr(haystack,needle), answer)
    }

    func test6() {
        let needle = "z"
        let haystack = "soda"
        let answer = -1

        XCTAssertEqual(Solution.strStr(haystack,needle), answer)
    }

    func test7() {
        let needle = "issip"
        let haystack = "mississippi"
        let answer = 4

        XCTAssertEqual(Solution.strStr(haystack,needle), answer)
    }

    func test8() {
        let needle = "aaa"
        let haystack = "aaaa"
        let answer = 0

        XCTAssertEqual(Solution.strStr(haystack,needle), answer)
    }
    
    func test9() {
        let needle = "aaaa"
        let haystack = "aaa"
        let answer = -1
        
        XCTAssertEqual(Solution.strStr(haystack,needle), answer)
    }
}

Tests.defaultTestSuite.run()
