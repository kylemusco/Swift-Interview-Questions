// https://leetcode.com/problems/best-time-to-buy-and-sell-stock

import UIKit
import XCTest

class Solution {
    // Time: O(n)
    // Space: O(1)
    static func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0
 
        for i in 0..<prices.count {
            // If we find a new lowest point, set to minPrice
            if (prices[i] < minPrice) {
                minPrice = prices[i]
                
            // If we find a new highest point, set to maxProfit
            } else if (prices[i] - minPrice > maxProfit) {
                maxProfit = prices[i] - minPrice
            }
        }
        
        return maxProfit
    }
}

class Tests : XCTestCase {
    func test1() {
        let prices = [7,1,5,3,6,4]
        let answer = 5
        
        XCTAssertEqual(Solution.maxProfit(prices), answer)
    }
    
    func test2() {
        let prices = [7,6,4,3,1]
        let answer = 0
        
        XCTAssertEqual(Solution.maxProfit(prices), answer)
    }
}

Tests.defaultTestSuite.run()
