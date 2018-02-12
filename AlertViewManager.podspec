#
#  Be sure to run `pod spec lint AlertViewManager.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "AlertViewManager"
  s.version      = "0.0.1"
  s.summary      = "AlertViewManager is a singleton class for dispalying the UIAlerts in the iOS applicaiton."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
s.description      = <<-DESC
AlertViewManager is a singleton class for dispalying the UIAlerts in the applicaiton. Also, this class solves the multiple alert displays same time in the application
DESC

  s.homepage     = "https://github.com/ApparaoMulpuri/AlertViewManager"
#s.screenshots  = "https://github.com/ApparaoMulpuri/AlertViewManager/blob/master/Screenshots/Screen%20Shot%202017-12-11%20at%204.00.42%20PM.png"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author    = "Appa Rao Mulpuri"
  # s.authors            = { "Appa Rao Mulpuri" => "apparao.mulpuri@gmail.com" }
  # s.social_media_url   = "http://twitter.com/Appa Rao Mulpuri"

#s.platform     = :ios
  # s.platform     = :ios, "5.0"

    s.ios.deployment_target = '8.0'
#s.swift_version = '4.0'
    s.source_files = 'AlertViewManager/AlertViewManager.swift'

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/ApparaoMulpuri/AlertViewManager.git", :tag => s.version.to_s }
end
