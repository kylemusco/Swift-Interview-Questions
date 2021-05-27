// https://leetcode.com/problems/verifying-an-alien-dictionary/

import UIKit
import XCTest

class Solution {
    static func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        // Iterate through each word in words
        for i in 0..<words.count-1 {
            // Iterate through each letter in words[i]
            for j in 0..<words[i].count {
                // If the inner loop has continued to the point where j is greater than the length of words[i+1],
                // this means the words are identical except that words[i] is longer meaning they are not in order
                if (j >= words[i+1].count) {
                    return false
                }

                // If characters do not match, check their order
                if (words[i][j] != words[i+1][j]) {
                    let currentWordChar = getIndex(c:words[i][j], word: order)
                    let nextWordChar = getIndex(c:words[i+1][j], word: order)

                    // words[i] comes after words[i+1] so return false
                    if (currentWordChar > nextWordChar) {
                        return false
                    }
                    
                    // Break out of the inner loop because words[i] comes before words[i+1]
                    break
                }
            }
        }
        
        return true
    }
    
    // Gets index of char in string as an integer
    private static func getIndex(c: Character, word: String) -> Int {
        if let i = word.firstIndex(of: c) {
            let index: Int = word.distance(from: word.startIndex, to: i)
            return index
        }
        
        return -1
    }
}

// This allows us to get a character from a string by passing in the index
// For example:
//  let str = "abc"
//  let c = str[2] (c equals "c")
extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

class Tests : XCTestCase {
    func test1() {
        XCTAssertTrue(Solution.isAlienSorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz"))
    }

    func test2() {
        XCTAssertFalse(Solution.isAlienSorted(["leetcode","hello"], "hlabcdefgijkmnopqrstuvwxyz"))
    }

    func test3() {
        XCTAssertFalse(Solution.isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz"))
    }
    
    func test4() {
        XCTAssertFalse(Solution.isAlienSorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz"))
    }

    func test5() {
        XCTAssertTrue(Solution.isAlienSorted(["app","apple"], "abcdefghijklmnopqrstuvwxyz"))
    }

    func test6() {
        XCTAssertTrue(Solution.isAlienSorted(["app","app","apps"], "abcdefghijklmnopqrstuvwxyz"))
    }

    func test7() {
        XCTAssertFalse(Solution.isAlienSorted(["app","apps","app"], "abcdefghijklmnopqrstuvwxyz"))
    }

    func test8() {
        XCTAssertTrue(Solution.isAlienSorted(["a"], "abcdefghijklmnopqrstuvwxyz"))
    }

    func test9() {
        XCTAssertTrue(Solution.isAlienSorted(["apap","app"], "abcdefghijklmnopqrstuvwxyz"))
    }
}

Tests.defaultTestSuite.run()
