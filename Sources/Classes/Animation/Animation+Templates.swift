//
//  Animation+Templates.swift
//  Pods-SUIKit_Example
//
//  Created by Maxim on 7/22/19.
//

public extension Animation {
    
    static func fadeIn(duration: TimeInterval = 0.6) -> Animation {
        Animation(duration: duration, operations: { $0.alpha = 1 })
    }
    
    static func resize(to size: CGSize, duration: TimeInterval = 0.6) -> Animation {
        Animation(duration: duration, operations: { $0.bounds.size = size })
    }
    
}
