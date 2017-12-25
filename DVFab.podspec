#
# Be sure to run `pod lib lint DVFab.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DVFab'
  s.version          = '1.5'
  s.summary          = 'A Floating Button.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Floating Button for Swift upgraded from Mariolannotta.
                       DESC

  s.homepage         = 'https://github.com/dienvu/DVFab.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dien.vu@outlook.com' => 'dien.vu@outlook.com' }
  s.source           = { :git => 'https://github.com/dienvu/DVFab.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'DVFab/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DVFab' => ['DVFab/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  # s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0'}

end
