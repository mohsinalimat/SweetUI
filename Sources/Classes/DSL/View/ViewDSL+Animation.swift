//
//  ViewDSL+Animation.swift
//  Pods-SUIKit_Example
//
//  Created by Maxim on 7/22/19.
//


// MARK: - Public
public extension ViewDSL {

    /// Performs specified animations.
    ///
    /// Performs animations sequentialy.
    ///
    /// - Parameter animations: A group of animations to perform.
    @discardableResult
    func animate(_ animations: Animation...) -> Self {
        animate(animations)
    }
    
    /// Performs specified animations.
    ///
    /// Performs animations sequentialy.
    ///
    /// - Parameter animations: An array of animations to perform.
    @discardableResult
    func animate(_ animations: [Animation]) -> Self {
        animate(.sequence, animations)
    }
    
    /// Performs specified animations.
    ///
    /// Performs animations sequentialy.
    ///
    /// - Parameter mode: Animation mode, that specifies execution behavior.
    /// - Parameter animations: A group of animations to perform.
    @discardableResult
    func animate(_ mode: Animation.Mode, _ animations: Animation...) -> Self {
        animate(mode, animations)
    }
    
    /// Performs specified animations.
    ///
    /// Performs animations sequentialy.
    ///
    /// - Parameter mode: Animation mode, that specifies execution behavior.
    /// - Parameter animations: An array of animations to perform.
    @discardableResult
    func animate(_ mode: Animation.Mode, _ animations: [Animation]) -> Self {
        modify {
            switch mode {
            case .parallel:
                animate(view: $0, animations: animations, inParallel: true)
            case .sequence:
                animate(view: $0, animations: animations, inParallel: false)
            }
        }
    }

}

// MARK: - Private
fileprivate extension ViewDSL {
    func animate(view: UIView, animations: [Animation]) {
        guard !animations.isEmpty else { return }
        
        var animations = animations
        let animation = animations.removeFirst()
        
        UIView.animate(withDuration: animation.duration,
                       delay: animation.delay,
                       options: animation.options,
                       animations: { animation.operations(view) },
                       completion: {
                        animation.completion?($0)
                        self.animate(view: view, animations: animations)
        })
    }
    
    func animate(view: UIView, animations: [Animation], inParallel: Bool) {
        guard inParallel else {
            animate(view: view, animations: animations)
            return
        }
        
        animations.forEach { animation in
            UIView.animate(withDuration: animation.duration,
                           delay: animation.delay,
                           options: animation.options,
                           animations: { animation.operations(view) },
                           completion: animation.completion)
        }
    }
    
}

