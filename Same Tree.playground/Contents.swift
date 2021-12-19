// https://leetcode.com/problems/same-tree/

import UIKit
import XCTest

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

class Solution {
    // Runtime: O(n)
    // Space: O(n)
    static func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        if p == nil || q == nil {
            return false
        }
        
        if p?.val != q?.val {
            return false
        }
        
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}

class Tests : XCTestCase {
    // Matching trees. This should be true
    func test1() {
        let p = TreeNode(1, TreeNode(1), TreeNode(1))
        let q = TreeNode(1, TreeNode(1), TreeNode(1))
        let answer = true
        
        XCTAssertEqual(Solution.isSameTree(p, q), answer)
    }
    
    // Trees with the same structure but different values. This should be false
    func test2() {
        let p = TreeNode(1, TreeNode(1), TreeNode(1))
        let q = TreeNode(1, TreeNode(1), TreeNode(2))
        let answer = false
        
        XCTAssertEqual(Solution.isSameTree(p, q), answer)
    }
    
    // Trees with different structures. This should be false
    func test3() {
        let p = TreeNode(1, TreeNode(1), TreeNode(1))
        let q = TreeNode(1, TreeNode(1), nil)
        let answer = false
        
        XCTAssertEqual(Solution.isSameTree(p, q), answer)
    }
    
    // Matching trees with only one node. This should be true
    func test4() {
        let p = TreeNode(1)
        let q = TreeNode(1)
        let answer = true
        
        XCTAssertEqual(Solution.isSameTree(p, q), answer)
    }
    
    // One tree is nil. This should be false
    func test5() {
        let p = TreeNode(1)
        let answer = false
        
        XCTAssertEqual(Solution.isSameTree(p, nil), answer)
    }
    
    // Trees with matching values and structure except one has an additional node. This should be false
    func test6() {
        let p = TreeNode(1, TreeNode(1), TreeNode(1))
        let q = TreeNode(1, TreeNode(1), TreeNode(1, TreeNode(1), nil))
        let answer = false
        
        XCTAssertEqual(Solution.isSameTree(p, q), answer)
    }
}

Tests.defaultTestSuite.run()
