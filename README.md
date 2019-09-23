# SweetUI 🍯

[![CI Status](https://travis-ci.org/maximkrouk/SweetUI.svg?branch=master)](https://travis-ci.org/mx-Cat/SweetUI) [![Version](https://img.shields.io/cocoapods/v/SweetUI.svg?style=flat)](https://cocoapods.org/pods/SweetUI) [![License](https://img.shields.io/cocoapods/l/SweetUI.svg?style=flat)](https://cocoapods.org/pods/SweetUI) [![Platform](https://img.shields.io/cocoapods/p/SweetUI.svg?style=flat)](https://cocoapods.org/pods/SweetUI)

__SwiftUI-like declarative UIKit based framework.__

SwiftUI is great but still lacks some useful features of UIKit and doesn't support older versions of iOS. This framework will allow you to use UIKit in a declarative way, pretty similar to SwiftUI, but with support of iOS11+ and well-known behavior of the system.

## Usage

```swift
import SweetUI

class ViewController: UIViewController {
    
    var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        view.ui.add {
            UIView {
                UIView {
                    UILabel(text: "1").ui
                        .frame(x: 0, y: 44, width: CGRect.screen.width, height: 20)
                        .link(to: &label)
                        .view
                    UILabel(text: "2").ui
                        .frame(x: 44, y: 88, width: CGRect.screen.width, height: 20)
                }
                UILabel(text: "3").ui
                    .frame(x: 88, y: 132, width: CGRect.screen.width, height: 20)
                UILabel(text: "4").ui
                    .frame(x: 132, y: 176, width: CGRect.screen.width, height: 20)
                UILabel(text: "5").ui
                    .frame(x: 176, y: 220, width: CGRect.screen.width, height: 20)
            }
            .ui
            .size(width: CGRect.screen.width, height: 100)
            .origin(x: 0, y: 0)
            .background(color: .red)
            .cornerRadius(18, corners: .bottom)
            UILabel(text: "6").ui
                .frame(x: 220, y: 264, width: CGRect.screen.width, height: 20)
            UILabel(text: "7").ui
                .frame(x: 264, y: 308, width: CGRect.screen.width, height: 20)
            UILabel(text: "8").ui
                .frame(x: 308, y: 352, width: CGRect.screen.width, height: 20)
        }
        .background(color: .yellow)
    }
    
}

```

_(Working on new features and documentation)_

#### Initialization

Custom initializers for ui elements, provided by __SweetUI__.

##### UIView

```swift
UIView {
    UIView()
}
```

##### UILabel

```swift
UILabel(text: "Label", alignment: .center, color: .black) {
    UIView()
}
```

#### ViewDSL

__SweetUI__ provides some DSLs for interaction with your view's properties. You can access these DSLs via `UIView()`__.ui__ property, which returns a ViewDSL or it's successor's instance.

## Requirements

- ⌨️    XCode11+
- 📱    iOS 11.0+

## Installation

SUILayout is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'SweetUI'
```

and run `pod install` from the terminal.

## License

SweetUI is available under the MIT license. See the LICENSE file for more info.

## To-do

- Add DSL's for every UIView subclass.
- Add convenience methods for user interaction, such as `tapAction(_ execute: ()->Void)`
- Complete xcode documentation.
- Provide more examples.
- Add API for shadows.
- Add more animation templates.
- Add layout engine.
- Make some API improvements.
- Add some classes like SUIGradientView.
- Provide DSLs for UIViewControllers.

------

*Feel free to contribute or [communicate](https://twitter.com/mxcat_). SweetUI is open to your ideas.* 🌝
