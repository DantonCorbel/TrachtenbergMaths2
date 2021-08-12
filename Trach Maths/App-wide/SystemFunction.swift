//
//  SystemFunction.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 8/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class Helper {
    
    static func setCustomFont(originalFont: CGFloat) -> CGFloat {
        
        //Current runable device/simulator width find
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        
        // basewidth you have set like your base storybord is IPhoneSE this storybord width 320px.
        let baseWidth: CGFloat = 320
        
        // "14" font size is defult font size
        let fontSize = originalFont * (width / baseWidth)
        
        return fontSize
    }
    
    static func addShadow(to layer: UIView) {
        layer.layer.shadowPath = UIBezierPath(rect: layer.bounds).cgPath
        layer.layer.shadowColor = ThemeManager.currentTheme().shadowColour
        layer.layer.shadowOpacity = 1
        layer.layer.shadowRadius = 10
        layer.layer.shadowOffset = .init(width: -2, height: 2)
    }
    
    static func buttonSetup(to layer: UIButton) {
        layer.backgroundColor = ThemeManager.currentTheme().buttonColour
           layer.titleLabel?.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 17))
            layer.layer.cornerRadius = 4
            layer.layer.borderWidth = 1
            layer.layer.borderColor = UIColor.black.cgColor
            
            layer.isEnabled = true
            
            Helper.addShadow(to: layer)
        
    }
    
}

// to allow padding to a UILabel (used in test view for the answer text)
@IBDesignable
class PaddingLabel: UILabel {
    var textEdgeInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    open override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textEdgeInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textEdgeInsets.top, left: -textEdgeInsets.left, bottom: -textEdgeInsets.bottom, right: -textEdgeInsets.right)
        return textRect.inset(by: invertedInsets)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textEdgeInsets))
    }
    
    @IBInspectable
    var paddingLeft: CGFloat {
        set { textEdgeInsets.left = newValue }
        get { return textEdgeInsets.left }
    }
    
    @IBInspectable
    var paddingRight: CGFloat {
        set { textEdgeInsets.right = newValue }
        get { return textEdgeInsets.right }
    }
    
    @IBInspectable
    var paddingTop: CGFloat {
        set { textEdgeInsets.top = newValue }
        get { return textEdgeInsets.top }
    }
    
    @IBInspectable
    var paddingBottom: CGFloat {
        set { textEdgeInsets.bottom = newValue }
        get { return textEdgeInsets.bottom }
    }
}



