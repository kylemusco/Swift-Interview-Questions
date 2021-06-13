// https://leetcode.com/problems/plus-one-linked-list/

import Foundation
import XCTest

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    // Runtime: O(n)
    // Memory: O(1)
    public static func plusOne(_ head: ListNode?) -> ListNode? {
        // Take the sentinel node approach:
        //    Init a node called "sentinel" with value of zero and next of "head"
        //    Traverse list until rightmost not-nine node is found
        //    Increment rightmost non-nine and set all nodes to the right to 0
        
        // Need to reinitialize head as a var so we can iterate through list
        var h = head
        
        let sentinel: ListNode? = ListNode(0, h)
        var notNine = sentinel
        
        // Search for rightmost value that's not 9
        while (h != nil) {
            if (h!.val != 9) {
                notNine = h!
            }
            h = h?.next
        }
        
        notNine!.val += 1
        notNine = notNine!.next
        
        // Set all values to the right of rightmost not-nine to 0
        while (notNine != nil) {
            notNine!.val = 0
            notNine = notNine!.next
        }
        
        // If sentinel != 0, an extra node was added and return sentintel. Otherwise return head
        return sentinel!.val != 0 ? sentinel! : sentinel!.next
    }
    
    // Runtime: O(n)
    // Memory: O(n)
    public static func plusOneStackMethod(_ head: ListNode?) -> ListNode? {
        // 1. Iterate to the end of the list,
        //      Add each node to a stack
        // 2. Iterate through stack
        //      Pop node from the end
        //      Increment value
        //      If value = 10, carry over 1
                
        var stack = [ListNode]()
        var node = head
                
        while (node != nil) {
            stack.append(node!)
            node = node!.next
        }
        
        var carry = false
        while (stack.count > 0) {
            let end = stack.popLast()!
            end.val += 1
            
            // If val >= 10, we need to carry the 1
            if (end.val >= 10) {
                end.val = 0
                carry = true
                
            } else {
                carry = false
            }
            
            // If we don't need to carry the one, we're done
            if (!carry) {
                break
            }
        }
        
        // If carry, add a ListNode to the front
        if (carry) {
            return ListNode(1, head)
        } else {
            return head
        }
    }
}

class Tests : XCTestCase {
    // 123 -> 124
    func test1() {
        let head = ListNode(1, ListNode(2, ListNode(3)))
        let answer = ListNode(1, ListNode(2, ListNode(4)))
        let solution = Solution.plusOne(head)

        eval(answer, solution!)
    }
    
    // 999 -> 1000
    func test2() {
        let head = ListNode(9, ListNode(9, ListNode(9)))
        let answer = ListNode(1, ListNode(0, ListNode(0, ListNode(0))))
        let solution = Solution.plusOne(head)
        
        eval(answer, solution!)
    }
    
    // 0 -> 1
    func test3() {
        let head = ListNode(0)
        let answer = ListNode(1)
        let solution = Solution.plusOne(head)

        eval(answer, solution!)
    }

    // 8999 -> 9000
    func test4() {
        let head = ListNode(8, ListNode(9, ListNode(9, ListNode(9))))
        let answer = ListNode(9, ListNode(0, ListNode(0, ListNode(0))))
        let solution = Solution.plusOne(head)

        eval(answer, solution!)
    }

    // 159 -> 160
    func test5() {
        let head = ListNode(1, ListNode(5, ListNode(9)))
        let answer = ListNode(1, ListNode(6, ListNode(0)))
        let solution = Solution.plusOne(head)

        eval(answer, solution!)
    }
    
    private func eval(_ list1: ListNode?, _ list2: ListNode?) {
        var l1 = list1
        var l2 = list2
        
        while (l2 != nil) {
            XCTAssertEqual(l1!.val, l2!.val)
            
            l2 = l2?.next
            
            if l1?.next != nil {
                l1 = l1!.next
            }
        }
    }
}

Tests.defaultTestSuite.run()
