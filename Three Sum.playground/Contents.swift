// https://leetcode.com/problems/3sum/

import UIKit
import XCTest

class Solution {
    public static func threeSum(_ nums: [Int]) -> [[Int]] {
        // Approach:
        // Add all nums to a dictionary
        // Use nested for loops to iterate through nums. Find the complement of nums[i]+nums[j] in the dictionary
        // If it exists, add to output set. Set is used to check for duplicate answers
        
        // Key is number in nums, value is number of occurrences
        var dict = [Int:Int]()
        var output = Set<[Int]>()
        
        for n in nums {
            if let existingCount = dict[n] {
                dict[n] = existingCount+1
            } else {
                dict[n] = 1
            }
        }
        
        for i in 0..<nums.count {
            for j in i..<nums.count {
                var dictCopy = dict
                
                // Get count for nums[i] and nums[j]
                let occurrencesOfI = dictCopy[nums[i]]!
                dictCopy[nums[i]] = dictCopy[nums[i]]! - 1
                
                let occurrencesOfJ = dictCopy[nums[j]]!
                dictCopy[nums[j]] = dictCopy[nums[j]]! - 1
                
                let compliment = 0 - (nums[i] + nums[j])
                
                if let complimentExists = dictCopy[compliment] {
                    if complimentExists > 0 && occurrencesOfI > 0 && occurrencesOfJ > 0 {
                        let solution = [nums[i],nums[j],compliment].sorted()
                        
                        // Check for existence of nums in output set
                        if !output.contains(solution) {
                            output.insert(solution)
                        }
                    }
                }
            }
        }
        
        // Convert set to array
        return Array(output)
    }
    
    public static func threeSumOld(_ nums: [Int]) -> [[Int]] {
        var solution = [[Int]]()
        
        // Map nums by (Value, Num occurrences)
        var map = [Int:Int]()
        for n in nums {
            let occurences = map[n] ?? 0
            map[n] = occurences+1
        }
        
        // Iterate through keys
        //  If there's a combination that equals 0, add to solutions list
        let keys = map.keys.sorted()
        for i in 0..<keys.count {
            // Create copy of map to handle occurrences. Occurrences will be decremented when used to calculate sum in order to keep track of duplicates
            var mapCopy = map
            var sum = keys[i]
            
            // Decrement occurrence
            mapCopy[sum] = mapCopy[sum]! - 1
            
            for j in 0..<keys.count {
                // Check occurrence to see if we have available values
                if (mapCopy[keys[j]]! <= 0) {
                    continue
                }
                sum = keys[j] + keys[i]
                
                // Decrement occurrence
                mapCopy[keys[j]] = mapCopy[keys[j]]! - 1
                
                // Check if map contains key for the difference
                let diff = sum > 0 ? 0-sum : abs(sum)
                
                // Check if diff exists in map and that we have occurrences left
                if (mapCopy[diff] ?? 0 > 0 ) {
                    sum += diff
                    
                    // If sum == 0, we have a possible solution
                    if (sum == 0) {
                        // Decrement occurrence
                        mapCopy[diff] = mapCopy[diff]! - 1
                        
                        // Check for duplicate solutions
                        let s = [keys[i], keys[j], diff].sorted()
                        if (!solution.contains(s)) {
                            solution.append(s)
                        }
                    }
                } else {
                    // If map does not contain diff (Or has any remanining occurrences), subtract last num
                    sum -= keys[j]
                }
            }
        }
        
        return solution
    }
}

class Tests : XCTestCase {
    private func evaluate(output: [[Int]], answer: [[Int]]) {
        XCTAssertTrue(output.count == answer.count)
        
        for triplet in answer {
            XCTAssertTrue(output.contains(triplet))
        }
    }
    
    public func test1() {
        let input = [-1,0,1,2,-1,-4]
        let answer = [[-1,-1,2],[-1,0,1]]
        let output = Solution.threeSum(input)
        
        evaluate(output: output, answer: answer)
    }
    
    public func test2() {
        let input = [Int]()
        let answer = [[Int]]()
        let output = Solution.threeSum(input)
        
        evaluate(output: output, answer: answer)
    }
    
    public func test3() {
        let input = [1,2]
        let answer = [[Int]]()
        let output = Solution.threeSum(input)
        
        evaluate(output: output, answer: answer)
    }
    
    public func test4() {
        let input = [-5,0,0,0,1,1,1,1,1,4,2,2,5,-1]
        let answer = [[-5,0,5], [-5,1,4], [0,0,0], [-1,0,1]]
        let output = Solution.threeSum(input)
        
        evaluate(output: output, answer: answer)
    }
    
    public func test5() {
        let input = [1,1,-2]
        let answer = [[-2,1,1]]
        let output = Solution.threeSum(input)
        
        evaluate(output: output, answer: answer)
    }
}

Tests.defaultTestSuite.run()
