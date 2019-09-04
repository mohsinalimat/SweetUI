//
//  UIButton+SweetUI.swift
//  Pods-SweetUI_Example
//
//  Created by Maxim Krouk on 9/4/19.
//

public extension UIButton {
    
    override var ui: ButtonDSL { ButtonDSL(self) }
    
}
