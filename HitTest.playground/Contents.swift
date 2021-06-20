// Implement the hitTest method
// Reference: https://khanlou.com/2018/09/hacking-hit-tests/
// Apple's docs: https://developer.apple.com/documentation/uikit/uiview/1622469-hittest

import UIKit

class CustomView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard isUserInteractionEnabled else { return nil }
        
        guard !isHidden else { return nil }
        
        guard alpha >= 0.01 else { return nil }
        
        // Checks if point is within view's bounds. If not, return nil
        guard self.point(inside: point, with: event) else { return nil }
        
        // Iterate through view tree and call hitTest to find front-most view that contains "point"
        // Reverse "subviews" because views towards the end are higher in Z axis (Closer to front)
        for subview in subviews.reversed() {
            
            // Convert "point" location to subview's frame of reference
            let convertedPoint = subview.convert(point, from: self)
            
            // If subview contains "convertedPoint", return subview
            if let candidate = subview.hitTest(convertedPoint, with: event) {
                return candidate
            }
        }
        
        // If none of the subviews contain the touch event, return self
        return self
    }
}
