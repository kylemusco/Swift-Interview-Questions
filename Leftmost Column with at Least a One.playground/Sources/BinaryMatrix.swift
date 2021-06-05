import Foundation

public class BinaryMatrix {
    var mat: [[Int]] = [[Int]]()
    
    public init(mat: [[Int]]) {
        self.mat = mat
    }
    
    public func dimensions() -> [Int] {
        return [self.mat.count, self.mat[0].count]
    }
    
    public func get(_ row: Int, _ col: Int) -> Int {
        return self.mat[row][col]
    }
}
