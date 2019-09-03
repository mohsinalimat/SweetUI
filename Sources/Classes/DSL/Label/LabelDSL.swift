//
//  LabelDSL.swift
//  SweetUI
//
//  Created by Maxim on 7/22/19.
//

// MARK: - Init
/// Class that provides a declarative api for interacting with UILabels.
public class LabelDSL: ViewDSL {

    /// Initializes and returns a newly allocated dsl object with specified managed label.
    ///
    /// - Parameter content: Closure, that specifies managed label.
    init(_ content: UILabel) {
        super.init(content)
    }
    
    /// The label, managed by the DSL.
    public var label: UILabel! { view as? UILabel }
    
}

// MARK: - Overridable
public extension LabelDSL {
    
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
    @objc override func modify(_ modification: (UILabel)->Void) -> Self {
        modification(label)
        return self
    }
    
    /// Adds a new SUITapGestureRecognizer to the view.
    ///
    /// - Parameter action: Action to execute on user's tap.
    /// - Returns: Caller instance.
    @discardableResult
    @objc override func tapAction(action: @escaping (UILabel) -> Void) -> Self {
        gestureRecognizer(SUITapGestureRecognizer { [weak label] in
            guard let label = label else { return }
            action(label)
        })
    }
    
}


// MARK: - Text
public extension LabelDSL {
    
    /// Sets a new value to managed label's attributed text property.
    ///
    /// - Parameter text: New text of the label.
    /// - Returns: Caller instance.
    @discardableResult
    func attributedText(_ text: NSAttributedString?) -> Self {
        modify{ $0.attributedText = text }
    }
    
    /// Sets a new value to the managed label's text property, sets new text allignment and color.
    ///
    /// - Parameter text: New text for the label.
    /// - Parameter alignment: New text allignment for the label.
    /// - Parameter color: New text color of the label.
    /// - Returns: Caller instance.
    @discardableResult
    func text(_ text: String?, alignment: NSTextAlignment, color: UIColor) -> Self {
        self.text(text)
            .text(alignment: alignment)
            .text(color: color)
    }
    
    /// Sets a new value to the managed label's text property and sets text allignment.
    ///
    /// - Parameter text: New text for the label.
    /// - Parameter alignment: New text allignment of the label.
    /// - Returns: Caller instance.
    @discardableResult
    func text(_ text: String?, alignment: NSTextAlignment) -> Self {
        self.text(text)
            .text(alignment: alignment)
    }
    
    /// Sets a new value to the managed label's text property and sets text allignment.
    ///
    /// - Parameter text: New text for the label.
    /// - Parameter color: New text color of the label.
    /// - Returns: Caller instance.
    @discardableResult
    func text(_ text: String?, color: UIColor) -> Self {
        self.text(text)
            .text(color: color)
    }
    
    /// Sets a new value to the managed label's text.
    ///
    /// - Parameter text: New text for of label.
    /// - Returns: Caller instance.
    @discardableResult
    func text(_ text: String?) -> Self {
        modify { $0.text = text }
    }
    
    /// Sets a new value to the managed label's text color.
    ///
    /// - Parameter color: New text color of the label.
    /// - Returns: Caller instance.
    @discardableResult
    func text(color: UIColor) -> Self {
        modify { $0.textColor = color }
    }
    
    /// Sets a new value to the managed label's highlighted text color.
    ///
    /// - Parameter color: New highlighted text color of the label.
    /// - Returns: Caller instance.
    @discardableResult
    func highlightedText(color: UIColor) -> Self {
        modify { $0.highlightedTextColor = color }
    }
    
    /// Sets a new value to the managed label's text allignment property.
    ///
    /// - Parameter alignment: New text allignment of the label.
    /// - Returns: Caller instance.
    @discardableResult
    func text(alignment: NSTextAlignment) -> Self {
        modify { $0.textAlignment = alignment }
    }
    
    /// Sets a new value to the managed label's font property.
    ///
    /// Uses system font.
    ///
    /// - Parameter size: Label's new font size.
    /// - Parameter weight: Label's font new weight.
    /// - Returns: Caller instance.
    @discardableResult
    func font(size: CGFloat, _ weight: UIFont.Weight = .regular) -> Self {
        self.font(.system(ofSize: size, weight: weight))
    }
    
    /// Sets a new value to the managed label's font property.
    ///
    /// - Parameter name: A name of label's new font.
    /// - Parameter size: Label's font new size.
    /// - Returns: Caller instance.
    @discardableResult
    func font(name: String, size: CGFloat) -> Self {
        modify { if let font = UIFont(name: name, size: size) { $0.ui.font(font) }}
    }
    
    /// Sets a new value to the managed label's font property.
    ///
    /// - Parameter descriptor: A descriptor of label's new font.
    /// - Parameter size: Label's font new size.
    /// - Returns: Caller instance.
    @discardableResult
    func font(descriptor: UIFontDescriptor, size: CGFloat) -> Self {
        modify { $0.ui.font(.init(descriptor: descriptor, size: size)) }
    }
    
    /// Sets a new value to the managed label's font property.
    ///
    /// - Parameter font: New font of the label.
    /// - Returns: Caller instance.
    @discardableResult
    func font(_ font: UIFont) -> Self {
        modify { $0.font = font }
    }
    
}
