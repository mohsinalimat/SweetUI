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
    
    private var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.ui.add {
            UIView().ui
                .background(color: .red)
                .size(.square(length: 100))
                .center(view.center)
                .cornerRadius(10)
                .alpha(0)
                .animate(.fadeIn(5, curve: .easeInOut))
                .view
            UILabel(text: "0", alignment: .center).ui
                .interaction(enabled: true)
                .font(size: 32, .semibold)
                .size(.square(length: 100))
                .center(view.center)
                .tapAction { [weak self] label in
                    guard let self = self else { return }
                    self.counter += 1
                    label.text = "\(self.counter)"
                }
                .link(to: &label)
                .view
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

