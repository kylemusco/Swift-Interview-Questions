// https://leetcode.com/problems/length-of-last-word/

import UIKit
import XCTest

class Solution {
    public static func lengthOfLastWord(_ s: String) -> Int {
        var length = 0
        
        // Iterate through string backwards, count number of non-space characters.
        for c in s.reversed() {
            if c != " " {
                length += 1
            } else if c == " " && length > 0 {
                return length
            }
        }
        
        return length
    }
    
    // Calling "split" is a slow operation
    public static func lengthOfLastWordSlow(_ s: String) -> Int {
        let words = s.split(separator: " ")
        
        return words[words.count-1].count
    }
}

class Tests : XCTestCase {
    func test1() {
        let s = "Hello world"
        let answer = 5
        
        XCTAssertEqual(Solution.lengthOfLastWord(s), answer)
    }
    
    func test2() {
        let s = "   fly me   to   the moon  "
        let answer = 4
        
        XCTAssertEqual(Solution.lengthOfLastWord(s), answer)
    }
    
    func test3() {
        let s = "luffy is still joyboy"
        let answer = 6
        
        XCTAssertEqual(Solution.lengthOfLastWord(s), answer)
    }
}

Tests.defaultTestSuite.run()
