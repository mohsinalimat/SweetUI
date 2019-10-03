#
# Be sure to run `pod lib lint SweetUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SweetUI'
  s.version          = '0.2.2'
  s.summary          = 'Declarative UI framework.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Declarative UI framework, based on UIKit.
  Keywords: UIKit, Foundation, SwiftUI, Interface, Declarative, UI, Swift, Cocoapods, Framework.
                       DESC

  s.homepage         = 'https://github.com/mx-cat/SweetUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mx-Cat' => 'id.maximkrouk@gmail.com' }
  s.source           = { :git => 'https://github.com/maximkrouk/SweetUI.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/maximkrouk'
  
  s.ios.deployment_target = '10.0'
  s.swift_version = '5.1'

  s.source_files = 'Sources/**/**/**/*'
  s.frameworks = 'UIKit', 'Foundation'
end
