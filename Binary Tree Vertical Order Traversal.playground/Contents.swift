// https://leetcode.com/problems/binary-tree-vertical-order-traversal/
import UIKit
import XCTest

class Solution {
    static func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        var solution = [[Int]]()
        
        // Check for empty input
        if (root == nil) {
            return solution
        }
        
        // We need to use a queue instead of a traditional BFS approach because we need to maintain row order
        var queue = [(node: TreeNode?, col: Int)]()
        
        // Map used to store values while we process tree
        // (column, values[])
        var map = [Int:[Int]]()
        
        // Add root node to queue
        queue.append((root!, 0))
        
        while(!queue.isEmpty) {
            let node = queue.first!
            
            // TODO: Use an actual queue and not an array. This is an expensive call - O(n)
            queue.removeFirst()
            
            // Check for empty tree node
            guard let n = node.node else {
                continue
            }
            
            // Get list for column or initialize new list
            var solutionList: [Int] = map[node.col, default: [Int]()]
            solutionList.append(n.val)
            
            // Update map with solution list
            map[node.col] = solutionList
            
            // Append children left to right to maintain row order
            queue.append((n.left, node.col-1))
            queue.append((n.right, node.col+1))
        }
        
        // Convert map to list
        let sortedColumns = Array(map.keys).sorted(by: <)
        for col in sortedColumns {
            solution.append(map[col]!)
        }
        
        return solution
    }
}

public class Tests : XCTestCase {
    
    // [3,9,20,null,null,15,7]
    public func test1() {
        let bottomLeft = TreeNode.init(15)
        let bottomRight = TreeNode.init(7)
        let midRight = TreeNode.init(20, bottomLeft, bottomRight)
        let midLeft = TreeNode.init(9)
        let root = TreeNode.init(3, midLeft, midRight)
        
        let answer = [[9],[3,15],[20],[7]]
        
        XCTAssertEqual(Solution.verticalOrder(root), answer)
    }
    
    // [null]
    public func test2() {
        let answer = [[Int]]()
        
        XCTAssertEqual(Solution.verticalOrder(nil), answer)
    }
    
    // [3,9,8,4,0,1,7]
    public func test3() {
        let bottomLeftLeft = TreeNode.init(4)
        let bottomLeftRight = TreeNode.init(0)
        let bottomRightLeft = TreeNode.init(1)
        let bottomRightRight = TreeNode.init(7)
        let middleLeft = TreeNode.init(9, bottomLeftLeft, bottomLeftRight)
        let middleRight = TreeNode.init(8, bottomRightLeft, bottomRightRight)
        let root = TreeNode.init(3, middleLeft, middleRight)
        
        let answer = [[4],[9],[3,0,1],[8],[7]]
        
        XCTAssertEqual(Solution.verticalOrder(root), answer)
    }
    
    // [3,9,8,4,0,1,7,null,null,null,2,5]
    public func test4() {
        let superBottomLeft = TreeNode.init(5)
        let superBottomRight = TreeNode.init(2)
        let bottomLeftLeft = TreeNode.init(4)
        let bottomLeftRight = TreeNode.init(0, superBottomLeft, nil)
        let bottomRightLeft = TreeNode.init(1, nil, superBottomRight)
        let bottomRightRight = TreeNode.init(7)
        let middleLeft = TreeNode.init(9, bottomLeftLeft, bottomLeftRight)
        let middleRight = TreeNode.init(8, bottomRightLeft, bottomRightRight)
        let root = TreeNode.init(3, middleLeft, middleRight)
        
        let answer = [[4],[9,5],[3,0,1],[8,2],[7]]
        
        XCTAssertEqual(Solution.verticalOrder(root), answer)
    }
}

Tests.defaultTestSuite.run()
