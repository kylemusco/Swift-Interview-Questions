// https://leetcode.com/problems/count-good-nodes-in-binary-tree/

import Foundation
import XCTest

class Solution {
    var goodNodes = 0
    
    // Runtime: O(n)
    // Memory: O(n)
    func goodNodes(_ root: TreeNode?) -> Int {
        // Recursively traverse tree
        //  Pass branch's max value is parameter
        //  If current val is >= max, incrememnt goodNodes and set max
        traverse(root, Int.min)
        
        return goodNodes
    }
    
    func traverse(_ node: TreeNode?, _ m: Int) {
        var max = m
        
        if (node == nil) {
            return
        }
        
        if (node!.val >= max) {
            goodNodes += 1
            max = node!.val
        }
        
        traverse(node!.left, max)
        traverse(node!.right, max)
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Tests: XCTestCase {
    func test1() {
        let solution = Solution()
        let root = TreeNode(3,
                            TreeNode(1,
                                     TreeNode(3),
                                     nil),
                            TreeNode(4,
                                     TreeNode(1),
                                     TreeNode(5)))
        let answer = 4
        
        XCTAssertEqual(solution.goodNodes(root), answer)
    }
    
    func test2() {
        let solution = Solution()
        let root: TreeNode? = nil
        let answer = 0
        
        XCTAssertEqual(solution.goodNodes(root), answer)
    }
    
    func test3() {
        let solution = Solution()
        let root = TreeNode(0)
        let answer = 1
        
        XCTAssertEqual(solution.goodNodes(root), answer)
    }
}

Tests.defaultTestSuite.run()
