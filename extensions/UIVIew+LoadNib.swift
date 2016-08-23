//
//  UIVIew+LoadNib.swift
//  Helpers
//

import UIKit

extension UIView {
    
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        
        return UINib( nibName: nibNamed, bundle: bundle).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}