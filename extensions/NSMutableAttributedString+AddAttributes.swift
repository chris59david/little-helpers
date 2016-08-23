//
//  NSMutableAttributedString+AddAttributes.swift
//  Helpers
//

import UIKit

extension NSMutableAttributedString {
        
    func addAttributesToSubstring(substring substring: String, attributes: [String: AnyObject]) {
        
        if let range = string.rangeOfString(substring) {
            
            let index : Int = string.startIndex.distanceTo(range.startIndex)
            let length : Int = substring.characters.count
            
            addAttributes(attributes, range: NSRange(location:index,length:length))
        }
    }
}
