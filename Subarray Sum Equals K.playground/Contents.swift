// https://leetcode.com/problems/subarray-sum-equals-k/

import Foundation
import XCTest

class Solution {
    // Runtime: O(n)
    // Memory: O(n)
    static func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        // Map nums by [Integer: # Occurrences of sum]
        var map = [Int:Int]()
        map[0] = 1
        
        var numSubArrays = 0
        
        // Iterate through nums, if map contains sum-k, increment by num occurrences of sum-k
        var sum = 0
        for i in 0..<nums.count {
            sum += nums[i]
            
            if map[sum-k] != nil {
                numSubArrays += map[sum-k] ?? 0
            }
            map[sum] = (map[sum] ?? 0) + 1
        }
        
        return numSubArrays
    }
}


public class Tests : XCTestCase {
    public func test1() {
        let nums = [1,1,1]
        let k = 2
        let answer = 2
        
        XCTAssertEqual(Solution.subarraySum(nums, k), answer)
    }
    
    public func test2() {
        let nums = [1,2,3]
        let k = 3
        let answer = 2
        
        XCTAssertEqual(Solution.subarraySum(nums, k), answer)
    }
    
    public func test3() {
        let nums = [-1,2,3]
        let k = 2
        let answer = 1
        
        XCTAssertEqual(Solution.subarraySum(nums, k), answer)
    }
    
    public func test4() {
        let nums = [2,-1,3]
        let k = 2
        let answer = 2
        
        XCTAssertEqual(Solution.subarraySum(nums, k), answer)
    }
    
    public func test5() {
        let nums = [Int]()
        let k = 2
        let answer = 0
        
        XCTAssertEqual(Solution.subarraySum(nums, k), answer)
    }
}

Tests.defaultTestSuite.run()
