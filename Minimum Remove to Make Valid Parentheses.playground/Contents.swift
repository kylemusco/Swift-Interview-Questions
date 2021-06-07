// https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/

import Foundation
import XCTest

class Solution {
    // Runtime: O(n) - 3 loops that each run at O(n)
    // Space: 0(n) - Stack, set and result are all O(n)
    public static func minRemoveToMakeValid(_ s: String) -> String {
        
        // Approach: maintain two variables,
        //  1 is a stack that keeps track of the indexes of left parenthesis.
        //      When char is left parenthesis, add index of parenthesis to stack
        //  2 is a set that keeps track of the indexes of unmatching right parenthesis
        //      When char is right parenthesis and stack is empty (There is not a matching left parenthesis) add index to set
        
        // 1 Iterate through string and populate stack and set
        // 2 Add remaining values in stack to set
        // 3 Create result by iterating through input string and only adding chars that do not exist in set
        
        var stack = [Int]()
        var set = Set<Int>()
        
        // Convert input string to array so we can use subscripts
        let str = Array(s)
        for i in 0..<str.count {
            // If left parenthesis, add index to stack
            if (str[i] == "(") {
                stack.append(i)
                
            // If right parenthesis, remove index from stack if it contains values. Otherwise add index to set
            } else if (str[i] == ")") {
                if (stack.isEmpty) {
                    set.insert(i)
                } else {
                    stack.popLast()
                }
            }
        }
        
        // Add all indexes in stack to set
        while(!stack.isEmpty) {
            set.insert(stack.popLast()!)
        }
        
        // Rebuild input string and leave out indexes in set
        var result = ""
        for i in 0..<str.count {
            if (!set.contains(i)) {
                result += String(str[i])
            }
        }
        
        return result
    }
}

class Tests : XCTestCase {
    func test1() {
        let s = "lee(t(c)o)de)"
        let answer = "lee(t(c)o)de"

        XCTAssertEqual(Solution.minRemoveToMakeValid(s), answer)
    }

    func test2() {
        let s = "a)b(c)d"
        let answer = "ab(c)d"

        XCTAssertEqual(Solution.minRemoveToMakeValid(s), answer)
    }

    func test3() {
        let s = "))(("
        let answer = ""

        XCTAssertEqual(Solution.minRemoveToMakeValid(s), answer)
    }

    func test4() {
        let s = "(a(b(c)d)"
        let answer = "a(b(c)d)"

        XCTAssertEqual(Solution.minRemoveToMakeValid(s), answer)
    }

    func test5() {
        let s = ")))))"
        let answer = ""

        XCTAssertEqual(Solution.minRemoveToMakeValid(s), answer)
    }

    func test6() {
        let s = "())()((("
        let answer = "()()"

        XCTAssertEqual(Solution.minRemoveToMakeValid(s), answer)
    }

    func test7() {
        let s = "v((((((())"
        let answer = "v(())"

        XCTAssertEqual(Solution.minRemoveToMakeValid(s), answer)
    }
    
    func test8() {
        let s = ")))t((u)"
        let answer = "t(u)"

        XCTAssertEqual(Solution.minRemoveToMakeValid(s), answer)
    }
}

Tests.defaultTestSuite.run()
