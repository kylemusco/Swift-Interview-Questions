// https://leetcode.com/problems/remove-duplicates-from-sorted-list/

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
    // Time: O(n)
    // Space: O(n)
    static func deleteDuplications(_ head: ListNode?) -> ListNode? {
        
        // Approach:
        // Traverse list, if next node is the same value, set "next" to the next node that's not a duplicate
        var h = head
        let n = h
        
        while h != nil {
            var next = h?.next
            
            // Find next node with different value
            while h?.val == next?.val {
                h?.next = next?.next
                
                next = next?.next
            }
            
            h = h?.next
        }
        
        return n
    }
}

class Tests : XCTestCase {
    func test1() {
        let list = ListNode(1, ListNode(2, ListNode(2, ListNode(3))))
        let answer = ListNode(1, ListNode(2, ListNode(3)))
        
        XCTAssertTrue(compareLists(Solution.deleteDuplications(list), answer))
    }
    
    func test2() {
        let list = ListNode(1, ListNode(2, ListNode(3, ListNode(3))))
        let answer = ListNode(1, ListNode(2, ListNode(3)))
        
        XCTAssertTrue(compareLists(Solution.deleteDuplications(list), answer))
    }
    
    func test3() {
        let list = ListNode(1, ListNode(1, ListNode(2, ListNode(3))))
        let answer = ListNode(1, ListNode(2, ListNode(3)))
        
        XCTAssertTrue(compareLists(Solution.deleteDuplications(list), answer))
    }
    
    func test4() {
        let list = ListNode(1, ListNode(1, ListNode(1, ListNode(3))))
        let answer = ListNode(1, ListNode(3))
        
        XCTAssertTrue(compareLists(Solution.deleteDuplications(list), answer))
    }
    
    // Returns true if lists match
    func compareLists(_ l1: ListNode?, _ l2: ListNode?) -> Bool {
        var l1 = l1
        var l2 = l2
        
        while l1 != nil && l2 != nil {
            if l1!.val != l2!.val {
                return false
            }
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        if l1 != nil {
            return false
        } else if l2 != nil {
            return false
        }
        
        return true
    }
}

Tests.defaultTestSuite.run()
