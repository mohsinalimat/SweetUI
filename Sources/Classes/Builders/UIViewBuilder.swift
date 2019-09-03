//
//  UIViewBuilder.swift
//  SweetUI
//
//  Created by Maxim on 7/22/19.
//

/// The `UIViewBuilder` type is a custom parameter attribute that constructs views from multi-statement
/// closures.
///
/// The typical use of `UIViewBuilder` is as a parameter attribute for child view-producing closure
/// parameters, allowing those closures to provide multiple child views. For example, the following
/// `UIView` function accepts a closure that produces one or more views via the `UIViewBuidler`.
///
/// ```
/// func labelStack(@ViewBuilder subviews: () -> UILabel) -> UIView
/// ```
///
/// Clients of this function can use multiple-statement closures to provide several child views, e.g.,
///
/// ```
/// myView.labelStack {
///     UILabel("First")
///     UILabel("Second")
///     UILabel("Third")
/// }
/// ```
@_functionBuilder
public struct UIViewBuilder {
    
    public typealias Block = () -> UIView
    
    public static func buildBlock(_ content: UIView...) -> UIView {
        let view = UIView()
        content.forEach{ view.ui.add(view: $0) }
        return view
    }
    
}
