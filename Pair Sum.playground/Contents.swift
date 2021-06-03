// https://leetcode.com/problems/max-number-of-k-sum-pairs/
// Except the same number can be used to make multiple pairs
// For ex: [1,5,3,3,3], k=6 - Output is 4 because you can make 3 pairs of 3's
import UIKit
import XCTest

class Solution {
    public static func numberOfWays(arr: [Int], k: Int) -> Int {
        // Iterate through arr and map ints to the number of times they occur
        // [Num : # Occurrences]
        var map: [Int:Int] = [Int:Int]()
        var validPairs = 0
        
        for i in arr {
          let occurrences = map[i] ?? 0
          map[i] = occurrences + 1
        }
        
        // Iterate through each num and check if compliment (k-num) exists in map
        //  If it does, decrement count for num and compliment
        for num in arr {
            let current = map[num] ?? 0
            let complement = map[k-num] ?? 0
          
            // If both have more than one occurrence, add valid pair and decrement occurences
            if (current > 0 && complement > 0) {
              
              // Handle case where num and compliment are the same but there's only one occurrence
              if (num == k-num && current < 2) {
                continue
              }
              
              // Handle case where we have more than 2 of the same
              if (num == k-num && current > 2) {
                validPairs += current * (current - 1) / 2
                map[num] = 0
                
              } else {
                map[num] = current - 1
                map[k-num] = complement - 1
                validPairs += 1
              }
            }
        }
        
        return validPairs
      }
}

class Tests : XCTestCase {
    func test1() {
        let arr = [1,2,3,4,3]
        let k = 6
        let answer = 2
        
        XCTAssertEqual(Solution.numberOfWays(arr: arr, k: k), answer)
    }
    
    func test2() {
        let arr = [1,5,3,3,3]
        let k = 6
        let answer = 4
        
        XCTAssertEqual(Solution.numberOfWays(arr: arr, k: k), answer)
    }
    
    func test3() {
        let arr = [1,3,2,2,2]
        let k = 4
        let answer = 4
        
        XCTAssertEqual(Solution.numberOfWays(arr: arr, k: k), answer)
    }
}


Tests.defaultTestSuite.run()
