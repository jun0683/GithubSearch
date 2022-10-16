//
//  Scroll+Extension.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/16.
//

import UIKit

extension UIScrollView {
    var isOverflowVertical: Bool {
        return self.contentSize.height > self.bounds.height && self.bounds.height > 0
    }
    
    func isReachedBottom(withTolerance tolerance: CGFloat = 0) -> Bool {
        guard self.isOverflowVertical else { return false }
        
        let contentOffsetBottom = self.contentOffset.y + self.bounds.height
        
        return contentOffsetBottom >= self.contentSize.height - tolerance
    }
}
