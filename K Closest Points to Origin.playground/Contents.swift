// https://leetcode.com/problems/k-closest-points-to-origin/

import Foundation
import XCTest

class Solution {
    public static func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        
        // Calculate distance for each point, store in dictionary where key is distance and value is array of points with that distance
        // Sort keys and return k closest points
        
        var dict = [Int:[[Int]]]()
        
        // Calculate distance of each point
        for point in points {
            let distance = calculateDistance(point)
            
            var calculatedPoints = dict[distance] ?? [[Int]]()
            calculatedPoints.append(point)
            
            dict[distance] = calculatedPoints
        }
        
        // Sort keys of dict O(nlogn)
        let keys = dict.keys.sorted()
        var result = [[Int]]()
        var i = 0
        
        while result.count < k {
            let p = dict[keys[i]]!
            
            // Add points to results
            for j in 0..<p.count {
                result.append(p[j])
                
                // If we have the results we need, break
                if result.count > k {
                    break
                }
            }
            
            i += 1
        }
        
        return result
    }
    
    // Trick: We don't need to calculate the actual distance. A rough estimate will do
    private static func calculateDistance(_ p: [Int]) -> Int {
        return p[0] * p[0] + p[1] * p[1]
    }
}

class Tests : XCTestCase {
    func test1() {
        let points = [[1,3],[-2,2]]
        let k = 1
        let output = [[-2,2]]
        
        XCTAssertEqual(Solution.kClosest(points, k), output)
        
    }
    
    func test2() {
        let points = [[3,3],[5,-1],[-2,4]]
        let k = 2
        let output = [[3,3],[-2,4]]
        
        XCTAssertEqual(Solution.kClosest(points, k), output)
        
    }
}

Tests.defaultTestSuite.run()
