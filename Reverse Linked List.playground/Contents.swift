// https://leetcode.com/problems/reverse-linked-list/

import UIKit
import XCTest

class Solution {
    public static func reverseList(_ head: ListNode?) -> ListNode? {
            var prev: ListNode? = nil
            var curr = head
            
            while(curr != nil) {
                // Keep track of next node in the list
                let temp = curr!.next
                
                // Point the current node to the last one to reverse the order
                curr!.next = prev
                
                // Set the last node we've traversed to the current node
                prev = curr
                
                // Set the current node to the next in the list
                curr = temp
            }
            
            return prev
        }
}

public class Tests : XCTestCase {
    
    // [1,2,3,4]
    public func test1() {
        let root = ListNode(1,
                            ListNode(2,
                                     ListNode(3,
                                              ListNode(4))))
        // Answer
        var answer: ListNode? = ListNode(4,
                                         ListNode(3,
                                                  ListNode(2,
                                                           ListNode(1))))

        var solution = Solution.reverseList(root)
        while(answer != nil) {
            XCTAssertEqual(answer!.val, solution!.val)

            answer = answer!.next ?? nil
            solution = solution?.next ?? nil
        }
    }
    
}

Tests.defaultTestSuite.run()
