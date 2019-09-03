//
//  SUITapGestureRecognizer.swift
//  SweetUI
//
//  Created by Maxim Krouk on 8/2/19.
//

public class SUITapGestureRecognizer: UITapGestureRecognizer {
    
    /// An action to be executed on tap.
    private var tapAction: Closure?
    public func tapAction(_ closure: Closure?) { tapAction = closure }
    
    /// Initializes and returns a newly allocated SUITapGestureRecognizer object with specified tap action.
    ///
    /// - Parameter action: Action to execute on user's tap.
    public init(tapAction: @escaping Closure) {
        self.tapAction = tapAction
        super.init(target: nil, action: nil)
        addTarget(self, action: #selector(handleTap))
    }
    
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        addTarget(self, action: #selector(handleTap))
    }
    
    @objc
    private func handleTap() { tapAction?() }
    
}
