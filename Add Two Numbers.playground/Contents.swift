// https://leetcode.com/problems/add-two-numbers/

import UIKit
import XCTest

public class ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }
    
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class Solution {
    // Time: O(n) where n is the length of the longest ListNode
    // Space: O(n)
    static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1: ListNode? = l1
        var l2: ListNode? = l2
        
        var result: ListNode? = ListNode(0)
        let head = result
        
        var hasRemainder = false
        
        while (l1 != nil || l2 != nil) {
            let n1 = l1?.val ?? 0
            let n2 = l2?.val ?? 0
            
            var sum = n1 + n2
            
            if (hasRemainder) {
                sum += 1
                hasRemainder = false
            }
            
            if (sum > 9) {
                hasRemainder = true
                sum -= 10
            }
            
            result?.next = ListNode(sum)
            result = result?.next
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        // Check for leftover remainder
        if (hasRemainder) {
            result?.next = ListNode(1)
        }
        
        // Return next because we don't want starting node
        return head?.next
    }
    
    public static func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head
        
        while (curr != nil) {
            // Keep track of next node in the list
            let temp = curr!.next
            
            // Point the current node to the last one
            curr!.next = prev
            
            // Set the last node we've traversed to the current
            prev = curr
            
            // Set the current node to the next in the list
            curr = temp
            
        }
        
        
        return nil
    }
}

class Tests : XCTestCase {
    func test1() {
        // [2,4,3]
        let l1 = ListNode(2, ListNode(4, ListNode(3)))
        // [5,6,4]
        let l2 = ListNode(5, ListNode(6, ListNode(4)))
        // [7,0,8]
        let answer = ListNode(7, ListNode(0, ListNode(8)))
        
        XCTAssertEqual(Solution.addTwoNumbers(l1, l2), answer)
    }
    
    func test2() {
        // [9,9,9,9,9,9,9]
        let l1 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
        // [9,9,9,9]
        let l2 = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))
        // [8,9,9,9,0,0,0,1]
        let answer = ListNode(8, ListNode(9, ListNode(9, ListNode(9, ListNode(0, ListNode(0, ListNode(0, ListNode(1))))))))
        
        XCTAssertEqual(Solution.addTwoNumbers(l1, l2), answer)
    }
    
    func test3() {
        let l1 = ListNode(0)
        let l2 = ListNode(0)
        let answer = ListNode(0)
        
        XCTAssertEqual(Solution.addTwoNumbers(l1, l2), answer)
    }
}

Tests.defaultTestSuite.run()
