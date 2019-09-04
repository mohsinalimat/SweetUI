//
//  ViewController.swift
//  SweetUI
//
//  Created by Maxim Krouk on 08/02/2019.
//  Copyright (c) 2019 Maxim Krouk. All rights reserved.
//

import SweetUI

class ViewController: UIViewController {
    
    private(set) var label: UILabel?
    private(set) var rect: UIView?
    
    private var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.ui.add {
            UIView().ui
                .background(color: .init(white: 0.2, alpha: 1)).alpha(0)
                .shadow(.black)
                .cornerRadius(10)
                .size(.square(length: 100))
                .center(.init(x: view.center.x, y: -50))
                .animate(.parallel,
                         .move(center: view.center, duration: 5),
                         .fadeIn(5, curve: .easeInOut))
                .link(to: &rect)
            UILabel(text: "0", alignment: .center, color: .white).ui
                .font(size: 32, .semibold)
                .size(.square(length: 100))
                .center(.init(x: view.center.x, y: -50))
                .animate(.parallel, .move(center: view.center, duration: 5), .fadeIn(5, curve: .easeInOut))
                .interaction(enabled: true)
                .tapAction { [weak self] _ in
                    guard let self = self else { return }
                    self.counter += 1
                    self.updateLabel()
                }
                .link(to: &label)
            SUIButton(title: "Decrement") { [weak self] in
                guard let self = self else { return }
                self.counter -= 1
                self.updateLabel()
            }.ui
                .size(.init(width: 100, height: 30))
                .center(.init(x: view.center.x, y: view.center.y + 100))
        }
    }
    
    func updateLabel() {
        label?.text = "\(counter)"
        if counter.isMultiple(of: 10) {
            rect?.ui.animate(.fadeOut(1.2, completion: { [weak self] _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    guard let self = self else { return }
                    self.rect?.ui.animate(.fadeIn())
                }
            }))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

