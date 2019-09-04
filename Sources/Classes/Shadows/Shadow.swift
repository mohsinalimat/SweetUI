//
//  Shadow.swift
//  Pods-SweetUI_Example
//
//  Created by Maxim Krouk on 9/3/19.
//

import Foundation

public struct Shadow {

    let color: CGColor
    let radius: CGFloat
    let offset: CGSize
    let opacity: CGFloat
    
    public init(color: CGColor, radius: CGFloat, offset: CGSize, opacity: CGFloat = 1) {
        self.color   = color
        self.radius  = radius
        self.offset  = offset
        self.opacity = opacity
    }
    
    public init(_ color : UIColor = .black,
                radius  : CGFloat = 5,
                offset  : CGPoint = .zero,
                opacity : CGFloat = 0.7) {
        
        self.init(color   : color.cgColor,
                  radius  : radius,
                  offset  : .init(width: offset.x, height: offset.y),
                  opacity : opacity)
    }
    
}
