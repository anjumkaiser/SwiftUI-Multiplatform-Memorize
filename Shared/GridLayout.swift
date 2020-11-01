//
//  GridLayout.swift
//  Memorize
//
//  Created by Muhammad Anjum Kaiser on 28/08/2020.
//

import Foundation
import SwiftUI

struct GridLayout {
    private(set) var size: CGSize
    private(set) var rowCount: Int = 0
    private(set) var columnCount = 0
    private(set) var itemSize: CGSize
    
    
    init (itemCount: Int, nearAspectRatio desiredAspectRatio: Double = 1, in size: CGSize) {
        self.size = size
        rowCount = 3
        columnCount = 2
        itemSize = CGSize()
        itemSize.width = CGFloat(self.size.width) / CGFloat(columnCount) * CGFloat(desiredAspectRatio)
        itemSize.height = CGFloat(self.size.height) / CGFloat(rowCount) * CGFloat(desiredAspectRatio)
    }
    
    
    func location(ofItemAt index: Int) -> CGPoint {
        
        let padding = 10
        let initialX = 75
        let initialY = 90
        
        var x: CGFloat = CGFloat(initialX)
        var y: CGFloat = CGFloat(initialY)
        
        if index < 2 {
            x += (CGFloat (itemSize.width) * CGFloat(index))
        } else if index < 4 {
            x += (CGFloat (itemSize.width) * CGFloat(index - 2))
            y += (CGFloat (itemSize.height))
        } else if index < 6 {
            x += (CGFloat (itemSize.width) * CGFloat(index - 4))
            y += (CGFloat (itemSize.height) * 2)
        }
        
        x += CGFloat(padding)
        y += CGFloat(padding)
  
        let point = CGPoint(x: x, y: y)
        return point
    }
}
