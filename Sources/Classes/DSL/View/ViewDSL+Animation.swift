//
//  ViewDSL+Animation.swift
//  SweetUI
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
        
        animation.animator(for: view, completion: { [weak self] in
            guard let self = self else { return }
            self.animate(view: view, animations: animations)
        }).startAnimation()
    }
    
    func animate(view: UIView, animations: [Animation], inParallel: Bool) {
        guard inParallel else {
            animate(view: view, animations: animations)
            return
        }
        
        animations.forEach { $0.animator(for: view).startAnimation() }
    }
    
}

fileprivate extension Animation {
    
    func animator(for view: UIView, completion: (() -> Void)? = .none) -> UIViewPropertyAnimator {
        let totalDuration = delay + duration
        let delayFactor = delay / totalDuration
        let animator = UIViewPropertyAnimator(duration: totalDuration, curve: curve, animations: .none)
        
        animator.addAnimations({ self.operations(view) }, delayFactor: CGFloat(delayFactor))
        
        animator.addCompletion {
            self.completion?($0)
            completion?()
        }
        
        return animator
    }
    
}
