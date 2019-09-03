//
//  ViewDSL.swift
//  SweetUI
//
//  Created by Maxim on 7/19/19.
//

// MARK: - Init
/// Class that provides a declarative api for interacting with UIViews.
public class ViewDSL: NSObject {
    
    /// Stored view, managed by the DSL.
    private var content: UIView
    
    /// The view, managed by the DSL.
    public var view: UIView { content }
    
    /// Initializes and returns a newly allocated dsl object with specified managed view.
    ///
    /// - Parameter content: Closure, that specifies managed view.
    init(_ content: UIView) {
        self.content = content
    }
    
}

//MARK: - Other
public extension ViewDSL {
    
    /// Links the outer variable to the caller instance.
    ///
    /// Does nothing if caller instance is not castable to a variable type,
    /// otherwise erases outer variable and places the caller instance address into it.
    ///
    /// - Parameter ref: Outer variable, that will be linked to the caller instance.
    /// - Returns: Caller instance.
    @discardableResult
    func link<T: UIView>(to ref: inout T?) -> Self {
        modify{ if let view = $0 as? T { ref = view }}
    }
    
    /// Provides a closure with the caller instance as a parameter.
    ///
    /// Use it to modify caller instance.
    ///
    /// Override this method in custom UIView subclasses with your class modification parameter:
    ///
    /// ```(Class)->Void```
    ///
    /// to provide more convinient API.
    ///
    /// - Parameter modification: Closure that takes the caller instance as a parameter,
    /// - Returns: Caller instance.
    @discardableResult
    @objc func modify(_ modification: (UIView)->Void) -> Self {
        modification(view)
        return self
    }
    /// Specifies if the view is interactive.
    ///
    /// The same as `.isUserInteractionEnabled = enabled`, but fits SweetUI's chainable API.
    /// - Parameter enabled: New value for the property.
    /// - Returns: Caller instance.
    @discardableResult
    func interaction(enabled: Bool) -> Self {
        modify{ $0.isUserInteractionEnabled = enabled }
    }
    
    /// Hides the caller instance.
    ///
    /// The same as `.isHidden = true`, but fits SweetUI's chainable API.
    /// - Returns: Caller instance.
    @discardableResult
    func hide() -> Self {
        modify{ $0.isHidden = true }
    }
    
    /// Shows the caller instance.
    ///
    /// The same as `.isHidden = false`, but fits SweetUI's chainable API.
    /// - Returns: Caller instance.
    @discardableResult
    func show() -> Self {
        modify{ $0.isHidden = false }
    }
    
}

// MARK: - Colors
public extension ViewDSL {
    
    /// Sets the opacity of the caller instance by changing it's alpha value.
    ///
    /// - Parameter value: A new alpha value of the caller instance.
    /// - Returns: Caller instance.
    @discardableResult
    func alpha(_ value: CGFloat) -> Self {
        modify { $0.alpha = value }
    }
    
    /// Sets the background color of the caller instance.
    ///
    /// - Parameter color: A new backgroundColor of the caller instance.
    /// - Returns: Caller instance.
    @discardableResult
    func background(color: UIColor?) -> Self {
        modify { $0.backgroundColor = color }
    }
    
    /// Sets the tint color of the caller instance.
    ///
    /// - Parameter color: A new tintColor of the caller instance.
    /// - Returns: Caller instance.
    @discardableResult
    func tint(color: UIColor) -> Self {
        modify { $0.tintColor = color }
    }
    
}

// MARK: - Corners
public extension ViewDSL {
    
    /// Sets the corner radius of the view by masking specified corners.
    ///
    /// - Parameter value: A new cornerRadius of the caller instance's layer.
    /// - Returns: Caller instance.
    @discardableResult
    func cornerRadius(_ value: CGFloat) -> Self {
        modify {
            $0.layer.cornerRadius = value
            if #available(iOS 11.0, *) {
                $0.layer.maskedCorners = .init(.all)
            }
        }
    }
    
    /// Sets the corner radius of the view by masking specified corners.
    ///
    /// - Parameter value: A new cornerRadius of the caller instance's layer.
    /// - Parameter corners: Set of corners to create a new maskedCorners value of the caller instance's layer.
    /// - Returns: Caller instance.
    @available(iOS 11.0, *)
    @discardableResult
    func cornerRadius(_ value: CGFloat, corners: CACornerMask.Corner...) -> Self {
        cornerRadius(value, corners: Set(corners))
    }
    
    /// Sets the corner radius of the view by masking specified corners.
    ///
    /// - Parameter value: A new cornerRadius of the caller instance's layer.
    /// - Parameter corners: Set of corners to create a new maskedCorners value of the caller instance's layer. (`.all` by default).
    /// - Returns: Caller instance.
    @available(iOS 11.0, *)
    @discardableResult
    func cornerRadius(_ value: CGFloat, corners: CACornerMask.Corners) -> Self {
        modify {
            $0.layer.cornerRadius = value
            $0.layer.maskedCorners = .init(corners)
        }
    }
    
}

// MARK: - Frame
public extension ViewDSL {
    
    /// Sets the frame of the view.
    ///
    /// - Parameter x: View's frame.origin.x new value.
    /// - Parameter y: View's frame.origin.y new value.
    /// - Parameter width: View's frame.size.width new value.
    /// - Parameter height: View's frame.size.height new value.
    /// - Returns: Caller instance.
    @discardableResult
    func frame(x: Int, y: Int, width: Int, height: Int) -> Self {
        frame(.init(x: x, y: y, width: width, height: height))
    }
    
    /// Sets the frame of the view.
    ///
    /// - Parameter x: View's frame.origin.x new value.
    /// - Parameter y: View's frame.origin.y new value.
    /// - Parameter width: View's frame.size.width new value.
    /// - Parameter height: View's frame.size.height new value.
    /// - Returns: Caller instance.
    @discardableResult
    func frame(x: Double, y: Double, width: Double, height: Double) -> Self {
        frame(.init(x: x, y: y, width: width, height: height))
    }
    
    /// Sets the frame of the view.
    ///
    /// - Parameter x: View's frame.origin.x new value.
    /// - Parameter y: View's frame.origin.y new value.
    /// - Parameter width: View's frame.size.width new value.
    /// - Parameter height: View's frame.size.height new value.
    /// - Returns: Caller instance.
    @discardableResult
    func frame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> Self {
        frame(.init(x: x, y: y, width: width, height: height))
    }
    
    /// Sets the frame of the view.
    ///
    /// - Parameter origin: View's frame.origin new value.
    /// - Parameter size: View's frame.size new value.
    /// - Returns: Caller instance.
    @discardableResult
    func frame(origin: CGPoint, size: CGSize) -> Self {
        frame(.init(origin: origin, size: size))
    }
    
    /// Sets the frame of the view.
    ///
    /// - Parameter rect: New value for view's frame.
    /// - Returns: Caller instance.
    @discardableResult
    func frame(_ rect: CGRect) -> Self {
        modify { $0.frame = rect }
    }
    
}

// MARK: - Bounds
public extension ViewDSL {
    
    /// Sets the bounds of the view.
    ///
    /// - Parameter x: View's bounds.origin.x new value.
    /// - Parameter y: View's bounds.origin.y new value.
    /// - Parameter width: View's bounds.size.width new value.
    /// - Parameter height: View's bounds.size.height new value.
    /// - Returns: Caller instance.
    @discardableResult
    func bounds(x: Int, y: Int, width: Int, height: Int) -> Self {
        bounds(.init(x: x, y: y, width: width, height: height))
    }
    
    /// Sets the bounds of the view.
    ///
    /// - Parameter x: View's bounds.origin.x new value.
    /// - Parameter y: View's bounds.origin.y new value.
    /// - Parameter width: View's bounds.size.width new value.
    /// - Parameter height: View's bounds.size.height new value.
    /// - Returns: Caller instance.
    @discardableResult
    func bounds(x: Double, y: Double, width: Double, height: Double) -> Self {
        bounds(.init(x: x, y: y, width: width, height: height))
    }
    
    /// Sets the bounds of the view.
    ///
    /// - Parameter x: View's bounds.origin.x new value.
    /// - Parameter y: View's bounds.origin.y new value.
    /// - Parameter width: View's bounds.size.width new value.
    /// - Parameter height: View's bounds.size.height new value.
    /// - Returns: Caller instance.
    @discardableResult
    func bounds(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> Self {
        bounds(.init(x: x, y: y, width: width, height: height))
    }
    
    /// Sets the bounds of the view.
    ///
    /// - Parameter origin: View's bounds.origin new value.
    /// - Parameter size: View's bounds.size new value.
    /// - Returns: Caller instance.
    @discardableResult
    func bounds(origin: CGPoint, size: CGSize) -> Self {
        bounds(.init(origin: origin, size: size))
    }
    
    /// Sets the bounds of the view.
    ///
    /// - Parameter rect: New value for view's bounds.
    /// - Returns: Caller instance.
    @discardableResult
    func bounds(_ rect: CGRect) -> Self {
        modify { $0.bounds = rect }
    }
    
}

// MARK: - Origin
public extension ViewDSL {
    
    /// Sets the origin of the view.
    ///
    /// - Parameter x: View's origin.x new value.
    /// - Parameter y: View's origin.y new value.
    /// - Returns: Caller instance.
    @discardableResult
    func origin(x: Int, y: Int) -> Self {
        origin(.init(x: x, y: y))
    }
    
    /// Sets the origin of the view.
    ///
    /// - Parameter x: View's origin.x new value.
    /// - Parameter y: View's origin.y new value.
    /// - Returns: Caller instance.
    @discardableResult
    func origin(x: Double, y: Double) -> Self {
        origin(.init(x: x, y: y))
    }
    
    /// Sets the origin of the view.
    ///
    /// - Parameter x: View's origin.x new value.
    /// - Parameter y: View's origin.y new value.
    /// - Returns: Caller instance.
    @discardableResult
    func origin(x: CGFloat, y: CGFloat) -> Self {
        origin(.init(x: x, y: y))
    }
    
    /// Sets the origin of the view.
    ///
    /// - Parameter point: New value for view's origin.
    /// - Returns: Caller instance.
    @discardableResult
    func origin(_ point: CGPoint) -> Self {
        modify { $0.frame.origin = point }
    }
    
}

// MARK: - Size
public extension ViewDSL {
    
    /// Sets the bounds of the view.
    ///
    /// - Parameter width: View's size.width new value.
    /// - Parameter height: View's size.height new value.
    /// - Returns: Caller instance.
    @discardableResult
    func size(width: Int, height: Int) -> Self {
        size(.init(width: width, height: height))
    }
    
    /// Sets the bounds of the view.
    ///
    /// - Parameter width: View's size.width new value.
    /// - Parameter height: View's size.height new value.
    /// - Returns: Caller instance.
    @discardableResult
    func size(width: Double, height: Double) -> Self {
        size(.init(width: width, height: height))
    }
    
    /// Sets the bounds of the view.
    ///
    /// - Parameter width: View's size.width new value.
    /// - Parameter height: View's size.height new value.
    /// - Returns: Caller instance.
    @discardableResult
    func size(width: CGFloat, height: CGFloat) -> Self {
        size(.init(width: width, height: height))
    }
    
    /// Sets the size of the view.
    ///
    /// - Parameter size: New value for view's size.
    /// - Returns: Caller instance.
    @discardableResult
    func size(_ size: CGSize) -> Self {
        modify { $0.bounds.size = size }
    }
    
}

// MARK: - Center
public extension ViewDSL {
    
    /// Sets the center of the view.
    ///
    /// - Parameter x: View's center.x new value.
    /// - Parameter y: View's center.y new value.
    /// - Returns: Caller instance.
    @discardableResult
    func center(x: Int, y: Int) -> Self {
        center(.init(x: x, y: y))
    }
    
    /// Sets the center of the view.
    ///
    /// - Parameter x: View's center.x new value.
    /// - Parameter y: View's center.y new value.
    /// - Returns: Caller instance.
    @discardableResult
    func center(x: Double, y: Double) -> Self {
        center(.init(x: x, y: y))
    }
    
    /// Sets the center of the view.
    ///
    /// - Parameter x: View's center.x new value.
    /// - Parameter y: View's center.y new value.
    /// - Returns: Caller instance.
    @discardableResult
    func center(x: CGFloat, y: CGFloat) -> Self {
        center(.init(x: x, y: y))
    }
    
    /// Sets the center of the view.
    ///
    /// - Parameter point: New value for view's center.
    /// - Returns: Caller instance.
    @discardableResult
    func center(_ point: CGPoint) -> Self {
        modify { $0.center = point }
    }
    
}

// MARK: - Gesture recognizers
public extension ViewDSL {
    
    /// Adds a new UITapGestureRecognizer to the view.
    ///
    /// - Parameter target: Action's selector target.
    /// - Parameter action: Selector for gesture recognizer.
    /// - Returns: Caller instance.
    @discardableResult
    func tapRecognizer(target: Any?, action: Selector?) -> Self {
        gestureRecognizer(UITapGestureRecognizer(target: target, action: action))
    }
    
    /// Adds a new UIPanGestureRecognizer to the view.
    ///
    /// - Parameter target: Action's selector target.
    /// - Parameter action: Selector for gesture recognizer.
    /// - Returns: Caller instance.
    @discardableResult
    func panRecognizer(target: Any?, action: Selector?) -> Self {
        gestureRecognizer(UIPanGestureRecognizer(target: target, action: action))
    }
    
    /// Adds a new UIPressGestureRecognizer to the view.
    ///
    /// - Parameter target: Action's selector target.
    /// - Parameter action: Selector for gesture recognizer.
    /// - Returns: Caller instance.
    @discardableResult
    func pressRecognizer(target: Any?, action: Selector?) -> Self {
        gestureRecognizer(UILongPressGestureRecognizer(target: target, action: action))
    }
    
    /// Adds a new UISwipeGestureRecognizer to the view.
    ///
    /// - Parameter target: Action's selector target.
    /// - Parameter action: Selector for gesture recognizer.
    /// - Returns: Caller instance.
    @discardableResult
    func swipeRecognizer(target: Any?, action: Selector?) -> Self {
        gestureRecognizer(UISwipeGestureRecognizer(target: target, action: action))
    }
    
    /// Adds a new UIPinchGestureRecognizer to the view.
    ///
    /// - Parameter target: Action's selector target.
    /// - Parameter action: Selector for gesture recognizer.
    /// - Returns: Caller instance.
    @discardableResult
    func pinchRecognizer(target: Any?, action: Selector?) -> Self {
        gestureRecognizer(UIPinchGestureRecognizer(target: target, action: action))
    }
    
    /// Adds a new UIRotationGestureRecognizer to the view.
    ///
    /// - Parameter target: Action's selector target.
    /// - Parameter action: Selector for gesture recognizer.
    /// - Returns: Caller instance.
    @discardableResult
    func rotationRecognizer(target: Any?, action: Selector?) -> Self {
        gestureRecognizer(UIRotationGestureRecognizer(target: target, action: action))
    }
    
    /// Adds a new UITapGestureRecognizer to the view.
    ///
    /// DSL's view will be automatically set as a target for a new gesture recognizer.
    ///
    /// - Parameter action: Selector for gesture recognizer.
    /// - Returns: Caller instance.
    @discardableResult
    func tapRecognizer(action: Selector?) -> Self {
        gestureRecognizer(UITapGestureRecognizer(target: view, action: action))
    }
    
    /// Adds a new UIPanGestureRecognizer to the view.
    ///
    /// DSL's view will be automatically set as a target for a new gesture recognizer.
    ///
    /// - Parameter action: Selector for gesture recognizer.
    @discardableResult
    func panRecognizer(action: Selector?) -> Self {
        gestureRecognizer(UIPanGestureRecognizer(target: view, action: action))
    }
    
    /// Adds a new UIPressGestureRecognizer to the view.
    ///
    /// DSL's view will be automatically set as a target for a new gesture recognizer.
    ///
    /// - Parameter action: Selector for gesture recognizer.
    /// - Returns: Caller instance.
    @discardableResult
    func pressRecognizer(action: Selector?) -> Self {
        gestureRecognizer(UILongPressGestureRecognizer(target: view, action: action))
    }
    
    /// Adds a new UISwipeGestureRecognizer to the view.
    ///
    /// DSL's view will be automatically set as a target for a new gesture recognizer.
    ///
    /// - Parameter action: Selector for gesture recognizer.
    /// - Returns: Caller instance.
    @discardableResult
    func swipeRecognizer(action: Selector?) -> Self {
        gestureRecognizer(UISwipeGestureRecognizer(target: view, action: action))
    }
    
    /// Adds a new UIPinchGestureRecognizer to the view.
    ///
    /// DSL's view will be automatically set as a target for a new gesture recognizer.
    ///
    /// - Parameter action: Selector for gesture recognizer.
    /// - Returns: Caller instance.
    @discardableResult
    func pinchRecognizer(action: Selector?) -> Self {
        gestureRecognizer(UIPinchGestureRecognizer(target: view, action: action))
    }
    
    /// Adds a new UIRotationGestureRecognizer to the view.
    ///
    /// DSL's view will be automatically set as a target for a new gesture recognizer.
    ///
    /// - Parameter action: Selector for gesture recognizer.
    /// - Returns: Caller instance.
    @discardableResult
    func rotationRecognizer(action: Selector?) -> Self {
        gestureRecognizer(UIRotationGestureRecognizer(target: view, action: action))
    }
    
    /// Adds a new UIGestureRecognizer to the view.
    ///
    /// - Parameter recognizer: Gesture recognizer, that will be added to DSL's view.
    /// - Returns: Caller instance.
    @discardableResult
    func gestureRecognizer(_ recognizer: UIGestureRecognizer) -> Self {
        modify { $0.addGestureRecognizer(recognizer) }
    }
    
    /// Adds a new SUITapGestureRecognizer to the view.
    ///
    /// - Parameter action: Action to execute on user's tap.
    /// - Returns: Caller instance.
    @discardableResult
    func tapAction(_ action: @escaping UIGestureRecognizer.Closure) -> Self {
        gestureRecognizer(SUITapGestureRecognizer(tapAction: action))
    }
    
}

// MARK: - Subviews
public extension ViewDSL {
    
    /// Adds subviews to a view.
    ///
    /// Wraps provided subviews in a container view, than adds a container view to DSL's view.
    ///
    /// - Parameter content: Multiline closure, which provides one or many child views.
    /// - Returns: Caller instance.
    @discardableResult
    func add(@SweetUI.UIViewBuilder content: SweetUI.UIViewBuilder.Block) -> Self {
        modify {
            let content = content()
            $0.ui.add(view: content)
            content.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                content.topAnchor.constraint(equalTo: $0.topAnchor),
                content.bottomAnchor.constraint(equalTo: $0.bottomAnchor),
                content.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
                content.trailingAnchor.constraint(equalTo: $0.trailingAnchor)])
        }
        //add(view: content())
    }
    
    /// Adds subviews to a view.
    ///
    /// Wraps provided subviews in a container view, than adds a container view to DSL's view.
    ///
    /// - Parameter content: Multiline closure, which provides one or many child views.
    /// - Parameter index: Index of a new subview.
    /// - Returns: Caller instance.
    @discardableResult
    func add(@SweetUI.UIViewBuilder content: SweetUI.UIViewBuilder.Block, at index: Int) -> Self {
        add(view: content(), at: index)
    }
    
    /// Adds subviews to a view.
    ///
    /// Wraps provided subviews in a container view, than adds a container view to DSL's view.
    ///
    /// - Parameter content: Multiline closure, which provides one or many child views.
    /// - Parameter subview: DSL view's subview, that will be below the container view.
    /// - Returns: Caller instance.
    @discardableResult
    func add(@SweetUI.UIViewBuilder content: SweetUI.UIViewBuilder.Block, above subview: UIView) -> Self {
        add(view: content(), above: subview)
    }
    
    /// Adds subviews to a view.
    ///
    /// Wraps provided subviews in a container view, than adds a container view to DSL's view.
    ///
    /// - Parameter content: Multiline closure, which provides one or many child views.
    /// - Parameter subview: DSL view's subview, that will be above the container view.
    /// - Returns: Caller instance.
    @discardableResult
    func add(@SweetUI.UIViewBuilder content: SweetUI.UIViewBuilder.Block, below subview: UIView) -> Self {
        add(view: content(), below: subview)
    }
    
    /// Adds subview to a view.
    ///
    /// - Parameter view: A new subview.
    /// - Returns: Caller instance.
    @discardableResult
    func add(view: UIView) -> Self {
        modify { $0.addSubview(view) }
    }
    
    /// Adds subview to a view.
    ///
    /// - Parameter view: A new subview.
    /// - Parameter index: Index of a new subview,.
    /// - Returns: Caller instance.
    @discardableResult
    func add(view: UIView, at index: Int) -> Self {
        modify { $0.insertSubview(view, at: index) }
    }
    
    /// Adds subview to a view.
    ///
    /// - Parameter view: A new subview.
    /// - Parameter subview: DSL view's subview, that will be below the view you add.
    /// - Returns: Caller instance.
    @discardableResult
    func add(view: UIView, above subview: UIView) -> Self {
        modify { $0.insertSubview(view, aboveSubview: subview) }
    }
    
    /// Adds subview to a view.
    ///
    /// - Parameter view: A new subview.
    /// - Parameter subview: DSL view's subview, that will be above the view you add.
    /// - Returns: Caller instance.
    @discardableResult
    func add(view: UIView, below subview: UIView) -> Self {
        modify { $0.insertSubview(view, belowSubview: subview) }
    }
    
    /// Removes subview from a view.
    ///
    /// Subview will be removed only if it's in the DSL's view hierarchy
    ///
    /// - Parameter view: A subview to remove.
    /// - Returns: Caller instance.
    @discardableResult
    func remove(view: UIView) -> Self {
        modify {
            while $0.superview != nil {
                if $0 === view.superview {
                    view.removeFromSuperview()
                    return
                }
            }
        }
    }
    
    /// Removes subview from a view.
    ///
    /// Subview will be removed only if it's in the DSL's view hierarchy
    ///
    /// - Parameter view: A subview, above the target view to remove.
    /// - Returns: Caller instance.
    @discardableResult
    func removeView(below view: UIView) -> Self {
        guard let index = view.subviews.firstIndex(where: { $0 === view }) else { return self }
        return removeView(at: index - 1)
    }
    
    /// Removes subview from a view.
    ///
    /// Subview will be removed only if it's in the DSL's view hierarchy
    ///
    /// - Parameter view: A subview, below the target view to remove.
    /// - Returns: Caller instance.
    @discardableResult
    func removeView(above view: UIView) -> Self {
        guard let index = view.subviews.firstIndex(where: { $0 === view }) else { return self }
        return removeView(at: index + 1)
    }
    
    /// Removes subview from a view.
    ///
    /// Subview will be removed only if it's in the DSL's view hierarchy
    ///
    /// - Parameter index: Index of the DSL's view subview to remove.
    /// - Returns: Caller instance.
    @discardableResult
    func removeView(at index: Int) -> Self {
        guard let view = view.subviews[safe: index] else { return self }
        return remove(view: view)
    }
    
    /// Removes all of subviews from the DSL's view hierarchy
    ///
    /// - Returns: Caller instance. 
    @discardableResult
    func removeSubviews() -> Self {
        modify { $0.subviews.forEach{ $0.removeFromSuperview() } }
    }
    
}

