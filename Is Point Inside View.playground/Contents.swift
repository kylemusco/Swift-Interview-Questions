// Return true if a UIView contains a given point

import UIKit
import XCTest

class Solution {
    public static func isPointInsideView(_ view: UIView, _ point: CGPoint) -> Bool {
        return point.x >= view.frame.minX &&
            point.x <= view.frame.maxX &&
            point.y >= view.frame.minY &&
            point.y <= view.frame.maxY
    }
}

public class Tests : XCTestCase {
    func test1() {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let point = CGPoint(x: 1, y: 1)
        
        XCTAssertTrue(Solution.isPointInsideView(view, point))
    }
    
    func test2() {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let point = CGPoint(x: 1000, y: 1000)
        
        XCTAssertFalse(Solution.isPointInsideView(view, point))
    }
}

Tests.defaultTestSuite.run()
