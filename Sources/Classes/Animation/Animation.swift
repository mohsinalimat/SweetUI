//
//  Animation.swift
//  SweetUI
//
//  Created by Maxim on 7/22/19.
//

/// Wrapper for animation.
public struct Animation {
    
    /// Type of animation execution.
    public enum Mode {
        
        /// Animations will be executed one by one.
        case sequence
        
        /// Animations will be executed simultaneously.
        case parallel
    }
    
    /// The total duration of the animation operations, measured in seconds.
    ///
    /// If you specify a negative value or 0, the changes are made without animating them.
    public let duration: TimeInterval
    
    /// The amount of time (measured in seconds) to wait before beginning the animations.
    ///
    /// A value of 0 will begin the animations immediately.
    public let delay: TimeInterval
    
    /// A mask of options indicating how you want to perform the animations.
    ///
    /// For a list of valid constants, see [UIView.AnimationOptions](https://developer.apple.com/documentation/uikit/uiview/animationoptions).
    public let options: UIView.AnimationOptions
    
    /// A block object containing the changes to commit to the views.
    ///
    /// This is where you programmatically change any animatable properties of the views in your view hierarchy.
    /// This block takes no parameters and has no return value.
    public let operations: (UIView) -> Void
    
    /// A block object to be executed when the animation sequence ends.
    ///
    /// This block has no return value and takes a single Boolean argument that indicates
    /// whether or not the animations actually finished before the completion handler was called.
    /// If the duration of the animation is 0, this block is performed at the beginning of the next run loop cycle.
    public let completion: ((Bool) -> Void)?
    
    /// Initializes and returns a newly allocated Animation object.
    ///
    /// - Parameter duration:
    /// The total duration of the animation operations, measured in seconds.
    /// If you specify a negative value or 0, the changes are made without animating them.
    ///
    /// - Parameter delay:
    /// The amount of time (measured in seconds) to wait before beginning the animations.
    /// Specify a value of 0 to begin the animations immediately.
    ///
    /// - Parameter options:
    /// A mask of options indicating how you want to perform the animations.
    /// For a list of valid constants, see [UIView.AnimationOptions](https://developer.apple.com/documentation/uikit/uiview/animationoptions).
    ///
    /// - Parameter operations:
    /// A block object containing the changes to commit to the views.
    /// This is where you programmatically change any animatable properties of the views in your view hierarchy.
    /// This block takes no parameters and has no return value.
    ///
    /// - Parameter completion:
    /// A block object to be executed when the animation sequence ends.
    /// This block has no return value and takes a single Boolean argument that indicates
    /// whether or not the animations actually finished before the completion handler was called.
    /// If the duration of the animation is 0, this block is performed at the beginning of the next run loop cycle.
    init(duration: TimeInterval = 0.3,
         delay: TimeInterval = 0,
         options: UIView.AnimationOptions = .init(),
         operations: @escaping (UIView) -> Void,
         completion: ((Bool) -> Void)? = nil)
    {
        self.duration = duration
        self.delay = delay
        self.options = options
        self.operations = operations
        self.completion = completion
    }
    
}

