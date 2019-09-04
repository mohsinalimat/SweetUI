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
        self.setTitle(title, for: .normal)
        self.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func handleTap() { action?() }
    
}
