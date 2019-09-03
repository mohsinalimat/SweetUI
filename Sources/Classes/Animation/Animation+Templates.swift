//
//  Animation+Templates.swift
//  SweetUI
//
//  Created by Maxim on 7/22/19.
//

public extension Animation {
    
    static func fadeOut(_ duration: TimeInterval = 0.6,
                        delay: TimeInterval = 0,
                        curve: UIViewAnimationCurve = .linear,
                        completion: ((UIViewAnimatingPosition) -> Void)? = .none) -> Animation {
        .init(duration: duration,
              delay: delay,
              curve: curve,
              operations: { $0.alpha = 1 },
              completion: completion)
    }
    
    static func fadeIn(_ duration: TimeInterval = 0.6,
                       delay: TimeInterval = 0,
                       curve: UIViewAnimationCurve = .linear,
                       completion: ((UIViewAnimatingPosition) -> Void)? = .none) -> Animation {
        .init(duration: duration,
              delay: delay,
              curve: curve,
              operations: { $0.alpha = 1 },
              completion: completion)
    }
    
    static func resize(to size: CGSize,
                       duration: TimeInterval = 0.6,
                       delay: TimeInterval = 0,
                       curve: UIViewAnimationCurve = .linear,
                       completion: ((UIViewAnimatingPosition) -> Void)? = .none) -> Animation {
        .init(duration: duration,
              delay: delay,
              curve: curve,
              operations: { $0.bounds.size = size },
              completion: completion)
    }
    
}
