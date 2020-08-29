//
//  GridLayout.swift
//  Memorize
//
//  Created by Muhammad Anjum Kaiser on 28/08/2020.
//

import Foundation
import SwiftUI

struct GridLayout {
    var size: CGSize
    var rowCount: Int = 0
    var columnCount = 0
    var itemSize: CGSize
    
    
    init (itemCount: Int, nearAspectRatio desiredAspectRatio: Double = 1, in size: CGSize) {
        self.size = size
        rowCount = 3
        columnCount = 3
        itemSize = CGSize()
        itemSize.width = CGFloat(self.size.width) / CGFloat(columnCount) * CGFloat(desiredAspectRatio)
        itemSize.height = CGFloat(self.size.height) / CGFloat(rowCount) * CGFloat(desiredAspectRatio)
    }
    
    
    func location(ofItemAt index: Int) -> CGPoint {
        
        let padding = 10
        let initialX = 50
        let initialY = 90
        
        var x: CGFloat = CGFloat(initialX)
        var y: CGFloat = CGFloat(initialY)
        
        if index < 3 {
            x += (CGFloat (itemSize.width) * CGFloat(index))
        } else if index < 6 {
            x += (CGFloat (itemSize.width) * CGFloat(index - 3))
            y += (CGFloat (itemSize.height))
        } else if index < 9 {
            x += (CGFloat (itemSize.width) * CGFloat(index - 6))
            y += (CGFloat (itemSize.height) * 2)
        }
        
        x += CGFloat(padding)
        y += CGFloat( padding)
  
        let point = CGPoint(x: x, y: y)
        return point
    }
}
