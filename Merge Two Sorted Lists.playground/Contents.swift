// https://leetcode.com/problems/merge-two-sorted-lists/

import UIKit
import XCTest

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    // Runtime: O(n+m) where n and m are the length of l1 and l2
    // Space: O(n+m)
    public static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var result: ListNode? = ListNode()
        let head = result
        
        // Set input to var so we can iterate through list
        var l1 = l1
        var l2 = l2
        
        // Iterate through both lists and add the smallest node to "result"
        while let l = l1, let r = l2 {
            if l.val < r.val {
                result!.next = l
                l1 = l1!.next
            } else {
                result!.next = r
                l2 = l2!.next
            }
            
            result = result!.next
        }
        
        // If any nodes are left in l1 or l2, add to "result"
        if let l = l1 {
            result!.next = l
        } else {
            result!.next = l2
        }
        
        // Return head.next which is first node in merged list
        return head!.next
    }
}

class Tests : XCTestCase {
    func test1() {
        let l1 = ListNode(1, ListNode(2, ListNode(4)))
        let l2 = ListNode(1, ListNode(3, ListNode(4)))
        let answer = ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(4))))))
        
        XCTAssertTrue(self.compareLists(answer, Solution.mergeTwoLists(l1, l2)))
    }
    
    func test2() {
        let l1 = ListNode(1, ListNode(2, ListNode(4)))
        let l2 = ListNode(1, ListNode(3, ListNode(4, ListNode(5))))
        let answer = ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(4, ListNode(5)))))))
        
        XCTAssertTrue(self.compareLists(answer, Solution.mergeTwoLists(l1, l2)))
    }
    
    func test3() {
        let l1 = ListNode(1, ListNode(3, ListNode(4, ListNode(5))))
        let l2 = ListNode(1, ListNode(2, ListNode(4)))
        let answer = ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(4, ListNode(5)))))))
        
        XCTAssertTrue(self.compareLists(answer, Solution.mergeTwoLists(l1, l2)))
    }
    
    // Helper for testing if lists match
    private func compareLists(_ l1: ListNode?, _ l2: ListNode?) -> Bool {
        var l1 = l1
        var l2 = l2
        
        while let l = l1, let r = l2 {
            if (l.val != r.val) {
                return false
            }
            
            l1 = l1!.next
            l2 = l2!.next
        }
        
        // Check for any remaining nodes
        if let l = l1 {
            return false
        }
        
        if let r = l2 {
            return false
        }
        
        return true
    }
}

Tests.defaultTestSuite.run()
