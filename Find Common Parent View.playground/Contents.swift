// Given 2 UIViews, find their common parent view
import UIKit
import XCTest

class Solution {
    public static func findParent(a: UIView, b: UIView) -> UIView? {
        var v1: UIView? = a
        var v2: UIView? = b
        
        // Handle edge case where nodes are the same
        if (v1 == v2) {
            return v1?.superview
        }
        
        // Iterate up parent tree until common parent is found
        while (v1 != v2) {
            v1 = v1 == nil ? b : v1?.superview
            v2 = v2 == nil ? a : v2?.superview
        }
        
        return v1
    }
}

public class Tests : XCTestCase {
    let v1 = UIView()
    let v2 = UIView()
    let v3 = UIView()
    let v4 = UIView()
    let v5 = UIView()
    let v6 = UIView()
    let v7 = UIView()
    let v8 = UIView()
    let v9 = UIView()
    let v10 = UIView()
    let v11 = UIView()
    
    private func createTree() {
        // Add v1 subviews
        v1.addSubview(v2)
        v1.addSubview(v3)
        v1.addSubview(v4)
        
        // Add v2 subviews
        v2.addSubview(v5)
        v2.addSubview(v9)
        
        // Add v4 subviews
        v4.addSubview(v7)
        v4.addSubview(v8)
        
        // Add v5 subviews
        v5.addSubview(v6)
        v5.addSubview(v10)
        
        // Add v10 subviews
        v10.addSubview(v11)
    }
    
    // Common parent of v6 and v10 is v5
    public func test1() {
        createTree()
        
        XCTAssertEqual(v5, Solution.findParent(a: v6, b: v10))
    }
    
    // Common parent of v8 and v11 is v1
    public func test2() {
        createTree()
        
        XCTAssertEqual(v1, Solution.findParent(a: v8, b: v11))
    }
    
    // Should return nil if views don't have common parent
    public func test3() {
        let orphanNode = UIView()
        
        XCTAssertEqual(nil, Solution.findParent(a: v8, b: orphanNode))
    }
    
    // Comparing the same node should return its parent
    public func test4() {
        createTree()
        
        XCTAssertEqual(v5, Solution.findParent(a: v6, b: v6))
    }
    
    // Common parent of v4 and v11 is v1
    public func test5() {
        createTree()
        
        XCTAssertEqual(v1, Solution.findParent(a: v4, b: v11))
    }
}

Tests.defaultTestSuite.run()





