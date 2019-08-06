//
//  SUITapGestureRecognizer.swift
//  SweetUI
//
//  Created by Maxim Krouk on 8/2/19.
//

public class SUITapGestureRecognizer: UITapGestureRecognizer {
    /// An action to be executed on tap.
    var tapAction: Closure?
    
    
    /// Initializes and returns a newly allocated SUITapGestureRecognizer object with specified tap action.
    ///
    /// - Parameter action: Action to execute on user's tap.
    convenience init(tapAction: @escaping Closure) {
        self.init(target: nil, action: nil)
        self.tapAction = tapAction
    }
    
    private override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        addTarget(self, action: #selector(handleTap))
    }
    
    @objc
    private func handleTap() { tapAction?() }
}
