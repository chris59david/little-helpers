//
//  NSDate+Convienence.swift
//  Helpers
//

import Foundation

extension NSDate {
    
    class func from(day day:Int, month:Int, year:Int, hour:Int, minute:Int, second:Int) -> NSDate {
        
        let c = NSDateComponents()
        c.day = day
        c.month = month
        c.year = year
        c.hour = hour
        c.minute = minute
        c.second = second
        
        let gregorian = NSCalendar(identifier:NSCalendarIdentifierGregorian)
        let date = gregorian?.dateFromComponents(c)
        return date!
    }
    
    
    func isGreaterThanDate(dateToCompare : NSDate, equal: Bool) -> Bool {

        var isGreater = false
        
        if self.compare(dateToCompare) == NSComparisonResult.OrderedDescending {

            isGreater = true
            
        } else if self.compare(dateToCompare) == NSComparisonResult.OrderedSame {
            
            if equal == true {
                
                isGreater = true
            }
        }
        
        return isGreater
    }
    
    
    func isLessThanDate(dateToCompare : NSDate, equal: Bool) -> Bool {

        var isLess = false
        
        if self.compare(dateToCompare) == NSComparisonResult.OrderedAscending {

            isLess = true
            
        } else if self.compare(dateToCompare) == NSComparisonResult.OrderedSame {
            
            if equal == true {
                
                isLess = true
            }
        }
        
        return isLess
    }
    
    func dateWithoutTime() -> NSDate {
        
        let dateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: self)
        
        return NSCalendar.currentCalendar().dateFromComponents(dateComponents)!
    }
}