// https://leetcode.com/problems/min-stack/

import UIKit
import XCTest

class MinStack {
    // Store numbers in an array of tuples
    // The first value represents to number inserted and the second is the min val up to that point in the stack
    // This allows us to pop values and still keep track of the min value in O(1)
    var stack: [(Int,Int)] = []

    init() {
        
    }
    
    func push(_ val: Int) {
        // If stack is empty, add val and set min to val
        if stack.isEmpty {
            stack.append((val,val))
            
        } else {
            stack.append((val, min(val,self.getMin())))
        }
    }
    
    func pop() {
        if !stack.isEmpty {
            stack.remove(at: stack.count-1)
        }
    }
    
    func top() -> Int {
        if !stack.isEmpty {
            return stack[stack.count-1].0
        }
        
        return Int.max
    }
    
    func getMin() -> Int {
        if !stack.isEmpty {
            return stack[stack.count-1].1
        }
        
        return Int.max
    }
}

class Tests : XCTestCase {
    func test1() {
        let minStack = MinStack()
        
        // Add 1
        minStack.push(1)
        XCTAssertEqual(minStack.top(), 1)
        
        // Add 2
        minStack.push(2)
        XCTAssertEqual(minStack.top(), 2)
        
        // Check min
        XCTAssertEqual(minStack.getMin(), 1)
        
        // Pop 2
        minStack.pop()
        XCTAssertEqual(minStack.top(), 1)
    }
    
    func test2() {
        let minStack = MinStack()
        
        // Add -2
        minStack.push(-2)
        XCTAssertEqual(minStack.top(), -2)
        
        // Add 0
        minStack.push(0)
        XCTAssertEqual(minStack.top(), 0)
        
        // Add -3
        minStack.push(-3)
        XCTAssertEqual(minStack.top(), -3)
        
        // Check min
        XCTAssertEqual(minStack.getMin(), -3)
        
        // Pop -3
        minStack.pop()
        XCTAssertEqual(minStack.top(), 0)
        
        // Check min
        XCTAssertEqual(minStack.getMin(), -2)
        
    }
    
    func test3() {
        let minStack = MinStack()
        
        // Check min
        XCTAssertEqual(minStack.getMin(), Int.max)
        
        // Add 1
        minStack.push(1)
        XCTAssertEqual(minStack.top(), 1)
        
        // Pop 1
        minStack.pop()
        XCTAssertEqual(minStack.top(), Int.max)
    }
}

Tests.defaultTestSuite.run()
