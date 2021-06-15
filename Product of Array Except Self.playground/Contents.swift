// https://leetcode.com/problems/product-of-array-except-self/

import Foundation
import XCTest

class Solution {
    // Runtime: O(n)
    // Memory: O(n)
    public static func productExceptSelf(_ nums: [Int]) -> [Int] {
        // We can find the product of all indexes besides the index we're on by calculating the product of all values to the left and right of it
        // Create 2 arrays for left / right sides
        // Iterate through nums populating the left and right arrays
        
        var left = [Int]()
        var right = [Int]()
                
        // Set default values
        left.append(1)
        right.append(1)
        
        for i in 0..<nums.count-1 {
            // Calculate left
            left.append(left[i] * nums[i])
                    
            // Calculate right
            right.append(right[i] * nums[nums.count-i-1])
        }
                
        // Calculate product of left and right arrays
        var answer = [Int]()
        for i in 0..<nums.count {
            answer.append(left[i] * right[nums.count-i-1])
        }
                
        return answer
    }}

class Tests : XCTestCase {
    func test1() {
        let nums = [1,2,3,4]
        let answer = [24,12,8,6]
        
        XCTAssertEqual(Solution.productExceptSelf(nums), answer)
    }
    
    func test2() {
        let nums = [-1,1,0,-3,3]
        let answer = [0,0,9,0,0]

        XCTAssertEqual(Solution.productExceptSelf(nums), answer)
    }
}

Tests.defaultTestSuite.run()
