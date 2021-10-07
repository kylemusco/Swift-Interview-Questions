// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

import UIKit
import XCTest

class Solution {
    static func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count-1
        
        // Initialize two variables pointing to the first and last indices
        // If their sum equals target, return indices
        // If their sum is less, increment left variable
        // If their sum is greater, decrement right variable
        while (left != right) {
            let sum = numbers[right] + numbers[left]
            
            if (sum == target) {
                // Note: Problems states that array is 1-indexed so we must increment by 1
                return [left+1, right+1]
            } else if (sum < target) {
                left = left + 1
            } else if (sum > target) {
                right = right - 1
            }
        }
        
        return [Int]()
    }
}

class Tests : XCTestCase {
    func test1() {
        let numbers = [2,7,11,15]
        let target = 9
        let answer = [1,2]
        
        XCTAssertEqual(Solution.twoSum(numbers, target), answer)
    }
    
    func test2() {
        let numbers = [2,3,4]
        let target = 6
        let answer = [1,3]
        
        XCTAssertEqual(Solution.twoSum(numbers, target), answer)
    }
    
    func test3() {
        let numbers = [-1, 0]
        let target = -1
        let answer = [1,2]
        
        XCTAssertEqual(Solution.twoSum(numbers, target), answer)
    }
}

Tests.defaultTestSuite.run()
