// https://leetcode.com/problems/search-insert-position/

import UIKit
import XCTest

class Solution {
    // Problem: Given an array of ints and a target, return the index where the target exists or the index where it should be inserted if it doesn't exist
    // Must have runtime of O(log n)
    
    // Runtime: O(log n)
    // Space: O(1)
    static func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        if nums[nums.count-1] < target {
            return nums.count
        }
        
        // Use binary search to find target or index of where it should be inserted
        var left = 0
        var right = nums.count-1
        var middle = 0
        
        while left <= right {
            middle = left + (right - left) / 2;
            
            if nums[middle] < target {
                left = middle+1
            } else if nums[middle] > target {
                right = middle-1
                
            // Target exists, return index
            } else {
                return middle
            }
        }
        
        // If target does not exist in nums, return left
        return left
    }
}

class Tests : XCTestCase {
    func test1() {
        let nums = [1,3,5,6]
        let target = 5
        let answer = 2

        XCTAssertEqual(Solution.searchInsert(nums, target), answer)
    }

    func test2() {
        let nums = [1,3,5,6]
        let target = 7
        let answer = 4

        XCTAssertEqual(Solution.searchInsert(nums, target), answer)
    }

    func test3() {
        let nums = [1,3,5,6]
        let target = 4
        let answer = 2

        XCTAssertEqual(Solution.searchInsert(nums, target), answer)
    }

    func test4() {
        let nums = [Int]()
        let target = 4
        let answer = 0

        XCTAssertEqual(Solution.searchInsert(nums, target), answer)
    }
    
    func test5() {
        let nums = [1,3,5,6]
        let target = 2
        let answer = 1
        
        XCTAssertEqual(Solution.searchInsert(nums, target), answer)
    }
}

Tests.defaultTestSuite.run()
