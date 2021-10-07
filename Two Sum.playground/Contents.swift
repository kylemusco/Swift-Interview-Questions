// https://leetcode.com/problems/two-sum/solution/

import UIKit
import XCTest

class Solution {
    // Time: O(n)
    // Space: O(n)
    static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Convert nums to a dictionary where the key is a value in nums and the value is the index O(n)
        var numDict = [Int: Int]()
        for i in 0...nums.count-1 {
            let num = nums[i]
            if (numDict[num] == nil) {
                numDict[num] = i
            }
        }
        
        // Iterate through nums, check if target - nums[i] exists in the set.
        for i in 1...nums.count-1 {
            let compliment = target - nums[i]
            
            // If numDict contains the difference, return indices of current num and difference
            if let index = numDict[compliment] {
                if (index != i) {
                    return [index, i]
                }
            }
        }
        
        return [Int]()
    }
}

class Tests : XCTestCase {
    func test1() {
        let nums = [2,7,11,15]
        let target = 9
        let answer = [0,1]

        XCTAssertEqual(Solution.twoSum(nums, target).sorted(), answer)
    }

    func test2() {
        let nums = [3,2,4]
        let target = 6
        let answer = [1,2]

        XCTAssertEqual(Solution.twoSum(nums, target).sorted(), answer)
    }
    
    func test3() {
        let nums = [3,3]
        let target = 6
        let answer = [0,1]
        
        XCTAssertEqual(Solution.twoSum(nums, target).sorted(), answer)
    }
}

Tests.defaultTestSuite.run()
