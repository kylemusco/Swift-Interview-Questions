// https://leetcode.com/problems/first-bad-version/

import Foundation
import XCTest

class VersionControl {
    // Array of versions where 1 means bad and 0 means not-bad
    var versions: [Int]
    
    init(versions: [Int]) {
        self.versions = versions
    }
    
    func isBadVersion(_ version: Int) -> Bool {
        return versions[version] == 1
    }
}

class Solution: VersionControl {
    public func firstBadVersion(_ n: Int) -> Int {
        // Naive approach: Iterate through array starting at index 0. Return index of first bad version
        // Better approach: Binary search
        //  Start at the middle index and check if version is bad
        //  If bad, move left
        //  If not bad, move right
        //  Continue until first bad version is found
        
        var left = 1
        var right = n
        
        while left < right {
            let mid = left + (right - left) / 2
            if isBadVersion(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}

class Tests : XCTestCase {
    func test1() {
        let versions = [0,0,0,1,1,1,1,1]
        let answer = 3
        let solution = Solution(versions: versions)
        
        XCTAssertEqual(solution.firstBadVersion(versions.count), answer)
    }
    
    func test2() {
        let versions = [1]
        let answer = 1
        let solution = Solution(versions: versions)
        
        XCTAssertEqual(solution.firstBadVersion(versions.count), answer)
    }
    
    func test3() {
        let versions = [0,0,0,0,0,0,0,1]
        let answer = 7
        let solution = Solution(versions: versions)
        
        XCTAssertEqual(solution.firstBadVersion(versions.count), answer)
    }
}

Tests.defaultTestSuite.run()
