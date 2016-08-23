//
//  UIView+Animations.swift
//  Helpers
//

import UIKit

private let kAnimationDuration: NSTimeInterval         = 1.2
private let kAnimationDamping: CGFloat                 = 0.65
private let kAnimationInitialSpringVelocity: CGFloat   = 0

public enum Direction {
    case Up
    case Down
    case Left
    case Right
}

extension UIView {
    
    func animateInViewElements(viewElements: [UIView], direction: Direction, initalDelay: Double, delayGap: Double, fade: Bool) {
        
        for index in 0..<viewElements.count {
            let delay = initalDelay + delayGap*Double(index)
            viewElements[index].slideViewWithBounce(self, delay: delay, direction: direction, fade: fade)
        }
    }
    
    func slideViewWithBounce(parentView: UIView, delay: Double, direction: Direction, fade: Bool) {
        
        var translateX:CGFloat = 0
        var translateY:CGFloat = 0
        
        switch direction {
            case Direction.Up:
                translateY = parentView.frame.size.height-frame.origin.y
            case Direction.Down:
                translateY = -parentView.frame.size.height+frame.origin.y
            case Direction.Left:
                translateX = parentView.frame.size.width-frame.origin.x
            case Direction.Right:
                translateX = -parentView.frame.size.width+frame.origin.x
        }
        
        if fade == true {
            
            alpha = 0
            
            if translateX > parentView.frame.size.width/2 {

                translateX = parentView.frame.size.width/2
            }
            
            if translateY > parentView.frame.size.height/2 {

                translateY = parentView.frame.size.height/2
            }

        }
        
        transform = CGAffineTransformTranslate(CGAffineTransformIdentity, translateX, translateY)
        userInteractionEnabled = false
        
        UIView.animateWithDuration(kAnimationDuration,
            delay: delay,
            usingSpringWithDamping: kAnimationDamping,
            initialSpringVelocity: kAnimationInitialSpringVelocity,
            options: .CurveEaseIn,
            animations: { () -> Void in
                
                self.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 0)
                
                if (fade == true) {

                    self.alpha = 1
                }
                
            }, completion: {finished in
                
                self.userInteractionEnabled = true
        })
    }
    
    func shakeIt(amountToShake: CGFloat = 10) {

        UIView.animateKeyframesWithDuration(0.2, delay: 0, options: [], animations: { () -> Void in
            // move it one way
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.5, animations: { () -> Void in
                self.transform = CGAffineTransformMakeTranslation(amountToShake, 0)
            })
            // and then the other
            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.5, animations: { () -> Void in
                self.transform = CGAffineTransformMakeTranslation(-(2*amountToShake), 0)
            })
            
            }) { (completed) -> Void in
                // now reset it the view
                UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: { () -> Void in
                    self.transform = CGAffineTransformIdentity
                    }, completion: nil)
        }
    }
    
    func startRotating(duration: Double = 1) {
        let kAnimationKey = "rotation"
        
        if self.layer.animationForKey(kAnimationKey) == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = duration
            animate.repeatCount = Float.infinity
            animate.fromValue = Float(M_PI * 2.0)
            animate.toValue = 0.0
            self.layer.addAnimation(animate, forKey: kAnimationKey)
        }
    }
    
    func stopRotating() {
        let kAnimationKey = "rotation"
        
        if self.layer.animationForKey(kAnimationKey) != nil {
            self.layer.removeAnimationForKey(kAnimationKey)
        }
    }
}
