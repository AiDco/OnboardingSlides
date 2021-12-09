#
#  Be sure to run `pod spec lint OnboardingSlides.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "OnboardingSlides"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of OnboardingSlides. A long description of OnboardingSlides"
  spec.license      = "MIT"
  spec.author       = { "Maxim Sororka" => "Maxim40a@icloud.com" }
  spec.homepage     = "http://EXAMPLE/OnboardingSlides"
  spec.source       = { :git => "https://github.com/lincelon/OnboardingSlides.git", :tag => "0.0.1" }
  spec.dependency "SnapKit"
end
