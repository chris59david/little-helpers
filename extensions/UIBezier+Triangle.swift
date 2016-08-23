//
//  UIBezier+Triangle.swift
//  Helpers
//

import UIKit

extension UIBezierPath {
    
    convenience init(rect: CGRect, direction: Direction) {
        self.init()
        
        var point1 = CGPointMake(0, 0)
        var point2 = CGPointMake(0, 0)
        var point3 = CGPointMake(0, 0)
        
        let topLeft = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect))
        let topRight = CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect))
        let bottomLeft = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect))
        let bottomRight = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect))
        
        let topMiddle = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect))
        let bottomMiddle = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect))
        let leftMiddle = CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect))
        let rightMiddle = CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect))
        
        if direction == Direction.Up {
            
            point1 = bottomLeft
            point2 = topMiddle
            point3 = bottomRight
            
        } else if direction == Direction.Down {
            
            point1 = topRight
            point2 = bottomMiddle
            point3 = topLeft
            
        } else if direction == Direction.Left {
            
            point1 = topRight
            point2 = leftMiddle
            point3 = bottomRight
            
        } else if direction == Direction.Right {
            
            point1 = topLeft
            point2 = rightMiddle
            point3 = bottomLeft
        }

        moveToPoint(point1)
        addLineToPoint(point2)
        addLineToPoint(point3)
        closePath()
    }
}
