// https://leetcode.com/problems/valid-palindrome-ii/

import UIKit
import XCTest

class Solution {
    public static func isPalindrome(_ s: String) -> Bool {
        // Pointers starting at front and back of 's'
        var i = 0
        var j = s.count-1
        
        // Convert s to a character array
        let str = Array(s)
        
        while (i<=j) {
            // If characters don't match, check if left and right sides are palindromes
            if (str[i] != str[j]) {
                let left = checkPalindrome(str, start: i, end: j-1)
                let right = checkPalindrome(str, start: i+1, end: j)
                
                // If neither side is a palindrome, there is no solution
                if (!left && !right) {
                    return false
                    
                // If one side is a palindrome, removing a single char will make the full string a palindrome. Return true
                } else if (left || right) {
                    return true
                }
            }
            i += 1
            j -= 1
        }
        
        return true
    }
    
    private static func checkPalindrome(_ s :[Character], start: Int, end: Int) -> Bool {
        var i = start
        var j = end
        
        while(i<=j) {
            if (s[i] != s[j]) {
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
        let s = "abca"
        let answer = true

        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }

    func test2() {
        let s = "abcadca"
        let answer = false

        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }

    func test3() {
        let s = "a"
        let answer = true

        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }

    func test4() {
        let s = "aa"
        let answer = true

        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }

    func test5() {
        let s = "abutttubas"
        let answer = true

        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }
    
    func test6() {
        let s = "deeeee"
        let answer = true

        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }
    
    func test7() {
        let s = "cbbcc"
        let answer = true

        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }
    
    func test8() {
        let s = "eeccccbebaeeabebccceea"
        let answer = false

        XCTAssertEqual(Solution.isPalindrome(s), answer)
    }
    
}

Tests.defaultTestSuite.run()
