//
//  CGRect+Extension.swift
//  Pods-SUIKit_Example
//
//  Created by Maxim on 7/22/19.
//

public extension CGFloat {
    
    /// Current screen size.
    static var screen: CGSize { CGSize.screen }
    
}

public extension CGSize {
    
    /// Current screen size.
    static var screen: CGSize { CGRect.screen.size }
    
}

public extension CGRect {
    
    /// Current screen bounds.
    static var screen: CGRect { UIScreen.main.bounds }
    
}
