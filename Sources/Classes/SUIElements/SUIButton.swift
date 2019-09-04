//
//  SUIButton.swift
//  Pods-SweetUI_Example
//
//  Created by Maxim Krouk on 9/4/19.
//

public class SUIButton: UIButton {
    
    /// An action to be executed on tap.
    private var action: (() -> Void)?
    public func action(_ closure: @escaping () -> Void) { self.action = closure }
    
    public init(title: String, action: @escaping () -> Void) {
        self.action = action
        super.init(frame: .zero)
        let color = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func handleTap() { action?() }
    
}
