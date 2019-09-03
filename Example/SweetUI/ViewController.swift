//
//  ViewController.swift
//  SweetUI
//
//  Created by Maxim Krouk on 08/02/2019.
//  Copyright (c) 2019 Maxim Krouk. All rights reserved.
//

import SweetUI

class ViewController: UIViewController {

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
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

