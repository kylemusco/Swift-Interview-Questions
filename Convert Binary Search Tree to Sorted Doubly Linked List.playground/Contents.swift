// https://leetcode.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list/

import Foundation

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    var first: Node? = nil
    var last: Node? = nil
    
    func treeToDoublyList(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        
        helper(root)
        
        last!.right = first
        first!.left = last
        
        return first
    }
    
    private func helper(_ node: Node?) {
        guard node != nil else {
            return
        }
        
        helper(node!.left)
        
        if last != nil {
            // Link the previous node (last) with the current one (node)
            last!.right = node
            node!.left = last
        } else {
            // Keep the smallest node to close DLL later on
            first = node
        }
        
        last = node
        helper(node!.right)
    }
}
