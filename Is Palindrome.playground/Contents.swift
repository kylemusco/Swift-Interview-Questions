// https://leetcode.com/problems/valid-palindrome/

import UIKit
import XCTest

class Solution {
    public static func isPalindrome(_ s: String) -> Bool {
        // Convert 's' to lower case and remove all non-alphanumeric characters
        let str = Array(s.lowercased().filter("abcdefghijklmnopqrstuvwxyz0123456789" .contains))
        
        // Maintain pointers starting at start and end of string
        var i = 0
        var j = str.count-1
        
        while(i<=j) {
            if (str[i] != str[j]) {
                return false
            }
            i += 1
            j -= 1
        }
        
        return true
    }
}

class Tests : XCTestCase {
    func test1() {
        let s = "A man, a plan, a canal: Panama"
        let answer = true
        
        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }
    
    func test2() {
        let s = "race a car"
        let answer = false
        
        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }
    
    func test3() {
        let s = ":  !0xx0"
        let answer = true
        
        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }
    
    func test4() {
        let s = ""
        let answer = true
        
        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }
    
    func test5() {
        let s = "1"
        let answer = true
        
        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }
    
    func test6() {
        let s = "aa"
        let answer = true
        
        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }
}


Tests.defaultTestSuite.run()
