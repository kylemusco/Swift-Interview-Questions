// https://leetcode.com/problems/container-with-most-water/

import UIKit
import XCTest

class Solution {
    static func maxArea(_ height: [Int]) -> Int {
        // Approach: Two pointers
        // Have one start at the front and the other at the end
        // Calculate the area, set to max if it's greater
        // Move pointer with lowest height towards the center
        var l = 0
        var r = height.count-1
        var maxArea = 0
        
        while l != r {
            let minHeight = min(height[l], height[r])
            
            // Calculate area
            let area = minHeight * (r-l)
            maxArea = max(area, maxArea)
            
            // Move pointers
            if height[l] == height[r] || height[l] < height[r] {
                l+=1
            } else {
                r-=1
            }
        }
        
        return maxArea
    }
    
    static func maxAreaSlow(_ height: [Int]) -> Int {
        // Approach: Brute force
        // Use two for loops to calculate the max water contained between two indexes
        var maxArea = Int.min
        
        for i in 0..<height.count-1 {
            for j in i+1..<height.count {
                // Figure out which column is lowest
                let minHeight = min(height[i], height[j])
                
                // Calculate area
                let water = minHeight * (j-i)
                maxArea = max(water, maxArea)
            }
        }
        
        return maxArea
    }
}

class Tests : XCTestCase {
    func test1() {
        let height = [1,8,6,2,5,4,8,3,7]
        let answer = 49
        
        XCTAssertEqual(Solution.maxArea(height), answer)
    }
    
    func test2() {
        let height = [1,1]
        let answer = 1
        
        XCTAssertEqual(Solution.maxArea(height), answer)
    }
    
    func test3() {
        let height = [3,1,1,3]
        let answer = 9
        
        XCTAssertEqual(Solution.maxArea(height), answer)
    }
}

Tests.defaultTestSuite.run()
