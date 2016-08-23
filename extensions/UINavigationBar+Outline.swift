//
//  UINavigationBar+Outline.swift
//  Helpers
//

import UIKit

private let kOutlineImageViewTag = 100001

extension UINavigationBar {
    
    func setBottomBorderColor(color: UIColor, height: CGFloat) {
        
        setBackgroundImage(UIImage(), forBarPosition: .Any, barMetrics: .Default)
        shadowImage = UIImage()
        
        if let existingView = viewWithTag(kOutlineImageViewTag) {
            
            existingView.removeFromSuperview()
        }
        
        let bottomBorderRect = CGRect(x: 0, y: frame.height-1, width: frame.width, height: height)
        let bottomBorderView = UIView(frame: bottomBorderRect)
        bottomBorderView.backgroundColor = color
        bottomBorderView.tag = kOutlineImageViewTag
        addSubview(bottomBorderView)
    }
}