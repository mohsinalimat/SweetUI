//public typealias ViewDSL = SUIKit.ViewDSL
//
//public struct SUIKit {}
//public extension SUIKit {
//    struct ContentBuilder<Body: UIView> {
//        public typealias Content = Body
//        public typealias Builder = ()->Content
//        var builder: Builder
//    }
//}
//
//public extension SUIKit {
//    struct ViewDSL<Content: UIView> {
//        private let content: Content
//        public init(_ view: Content) {
//            self.content = view
//        }
//
//        @discardableResult
//        public func modify(_ modification: (Content) -> Void) -> ViewDSL {
//            modification(content)
//            return self
//        }
//
//        @discardableResult
//        public func add<Body: UIView>(subviews: ContentBuilder<Body>.Builder) -> ViewDSL {
//            modify{ $0.addSubview(subviews()) }
//        }
//
//        @discardableResult
//        public func add<Body: UIView>(subviews: () -> ViewDSL<Body>) -> ViewDSL {
//            modify{ $0.addSubview(subviews().view) }
//        }
//
//
//        @discardableResult
//        public func animate(_ animations: Animation...) -> ViewDSL {
//            animate(animations)
//        }
//
//        @discardableResult
//        public func animate(_ animations: [Animation]) -> ViewDSL {
//            animate(.sequence, animations)
//        }
//
//        @discardableResult
//        public func animate(_ mode: Animation.Mode, _ animations: Animation...) -> ViewDSL {
//            animate(mode, animations)
//        }
//
//        @discardableResult
//        public func animate(_ mode: Animation.Mode, _ animations: [Animation]) -> ViewDSL {
//            modify {
//                switch mode {
//                case .parallel:
//                    animate(view: $0, animations: animations, inParallel: true)
//                case .sequence:
//                    animate(view: $0, animations: animations, inParallel: false)
//                }
//            }
//        }
//
//        fileprivate func animate(view: UIView, animations: [Animation]) {
//            guard !animations.isEmpty else { return }
//
//            var animations = animations
//            let animation = animations.removeFirst()
//
//            UIView.animate(withDuration: animation.duration,
//                           delay: animation.delay,
//                           options: animation.options,
//                           animations: { animation.operations(view) },
//                           completion: {
//                            animation.completion?($0)
//                            self.animate(view: view, animations: animations)
//            })
//        }
//
//        fileprivate func animate(view: UIView, animations: [Animation], inParallel: Bool) {
//            guard inParallel else {
//                animate(view: view, animations: animations)
//                return
//            }
//
//            animations.forEach { animation in
//                UIView.animate(withDuration: animation.duration,
//                               delay: animation.delay,
//                               options: animation.options,
//                               animations: { animation.operations(view) },
//                               completion: animation.completion)
//            }
//        }
//
//    }
//}
//
//public extension UIView {
//    var ui: ViewDSL<UIView> { ViewDSL(self) }
//}
//
//let view = UIView()
//
//public extension Animation {
//    static func fadeIn(duration: TimeInterval = 0.3) -> Animation {
//        return Animation(duration: duration, operations: { $0.alpha = 1 })
//    }
//
//    static func resize(to size: CGSize, duration: TimeInterval = 0.3) -> Animation {
//        return Animation(duration: duration, operations: { $0.bounds.size = size })
//    }
//}
//
//public struct Animation {
//    public enum Mode {
//        case sequence
//        case parallel
//    }
//
//    public let duration: TimeInterval
//    public let delay: TimeInterval
//    public let options: UIView.AnimationOptions
//    public let operations: (UIView) -> Void
//    public let completion: ((Bool) -> Void)?
//
//    init(duration: TimeInterval = 0.3,
//         delay: TimeInterval = 0,
//         options: UIView.AnimationOptions = .init(),
//         operations: @escaping (UIView) -> Void,
//         completion: ((Bool) -> Void)? = nil)
//    {
//        self.duration = duration
//        self.delay = delay
//        self.options = options
//        self.operations = operations
//        self.completion = completion
//    }
//}
//
//public extension SUIKit.ViewDSL where Content == UILabel {
//    func text(_ text: String? = "") -> ViewDSL<Content> {
//        modify{ $0.text = text }
//    }
//}
//
//extension UIView {
//    var v: ViewDSL<Self> {
//        ViewDSL(self as! Self)
//    }
//}


//// MARK: - Other
//public extension UILabel {
//
//    /// Provides a closure with the caller instance as a parameter.
//    ///
//    /// Use it to modify caller instance.
//    ///
//    /// Override this method in custom UILabel subclasses with your class modification parameter:
//    ///
//    /// ```(Class)->Void```
//    ///
//    /// to provide more convinient API.
//    ///
//    /// - Parameter modification: Closure that takes the caller instance as a parameter,
//    /// - Returns: Caller instance.
//    @discardableResult
//    override func modify(_ modification: (UILabel)->Void) -> Self {
//        modification(self)
//        return self
//    }
//
//}
