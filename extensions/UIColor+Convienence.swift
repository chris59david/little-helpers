//
//  UIColor+Convienence.swift
//  Helpers
//

import UIKit

extension UIColor {
    
    convenience init(hex: Int) {
        
        let components = (

            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
        
    }
    
    class func random() -> UIColor {
        
        return UIColor(red: CGFloat(arc4random_uniform(255))/255.0,
                       green: CGFloat(arc4random_uniform(255))/255.0,
                       blue: CGFloat(arc4random_uniform(255))/255.0,
                       alpha: 1)
    }
    
    func darkenColor(darkenAmount: CGFloat) -> UIColor {

        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            
            return UIColor(hue: h, saturation: s, brightness: b*(1.0-darkenAmount), alpha: a)
        }
        
        return UIColor.whiteColor()
    }
}