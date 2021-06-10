// https://leetcode.com/problems/dot-product-of-two-sparse-vectors/

import Foundation
import XCTest

class SparseVector {
    // Dictionary where key is index of non-zero and value is value
    var map = [Int:Int]()
        
    init(_ nums: [Int]) {
        // Only add non-zero values to map
        for i in 0..<nums.count {
            if (nums[i] != 0) {
                map[i] = nums[i]
            }
        }
    }

    // Return the dotProduct of two sparse vectors
    func dotProduct(_ vec: SparseVector) -> Int {
        var output = 0
            
        // If keys in vec exist in map, calculate dot product
        for key in vec.map.keys {
            if let val = self.map[key] {
                output += val * vec.map[key]!
            }
        }
            
        return output
    }
}

class Tests: XCTestCase {
    func test1() {
        let nums1 = SparseVector([1,0,0,2,3])
        let nums2 = SparseVector([0,3,0,4,0])
        let answer = 8
        
        XCTAssertEqual(nums1.dotProduct(nums2), answer)
    }
    
    func test2() {
        let nums1 = SparseVector([0,0,0,1,0])
        let nums2 = SparseVector([0,0,0,0,2])
        let answer = 0
        
        XCTAssertEqual(nums1.dotProduct(nums2), answer)
    }
    
    func test3() {
        let nums1 = SparseVector([0,1,0,0,2,0,0])
        let nums2 = SparseVector([1,0,0,0,3,0,4])
        let answer = 6
        
        XCTAssertEqual(nums1.dotProduct(nums2), answer)
    }
}

Tests.defaultTestSuite.run()
