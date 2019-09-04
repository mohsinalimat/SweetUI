//
//  ButtonDSL.swift
//  Pods-SweetUI_Example
//
//  Created by Maxim Krouk on 9/4/19.
//

// MARK: - Init
/// Class that provides a declarative api for interacting with UILabels.
public class ButtonDSL: ViewDSL {

    /// Initializes and returns a newly allocated dsl object with specified managed label.
    ///
    /// - Parameter content: Closure, that specifies managed label.
    init(_ content: UIButton) {
        super.init(content)
    }
    
    /// The label, managed by the DSL.
    public var button: UIButton! { view as? UIButton }
    
}


// MARK: - Overridable
public extension ButtonDSL  {
    
    /// Provides a closure with the caller instance as a parameter.
    ///
    /// Use it to modify caller instance.
    ///
    /// Override this method in custom UILabel subclasses with your class modification parameter:
    ///
    /// ```modification: (Class)->Void```
    ///
    /// to provide more convinient API.
    ///
    /// - Parameter modification: Closure that takes the caller instance as a parameter,
    /// - Returns: Caller instance.
    @discardableResult
    @objc override func modify(_ modification: (UIButton)->Void) -> Self {
        modification(button)
        return self
    }
    
    /// Adds a new SUITapGestureRecognizer to the view.
    ///
    /// - Parameter action: Action to execute on user's tap.
    /// - Returns: Caller instance.
    @discardableResult
    @objc override func tapAction(action: @escaping (UIButton) -> Void) -> Self {
        gestureRecognizer(SUITapGestureRecognizer { [weak button] in
            guard let button = button else { return }
            action(button)
        })
    }
    
}
