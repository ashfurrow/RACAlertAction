Pod::Spec.new do |s|
  s.name         = "RACAlertAction"
  s.version      = "0.1.0"
  s.summary      = "UIAlertAction subclass with support for ReactiveCocoa"
  s.description  = <<-DESC
                   iOS 8 introduced `UIAlertController`, an abstraction above and replacement
                   for `UIAlertView`. `UIAlertController` uses `UIAlertAction` instances
                   to represent buttons (and actions for those buttons). But the interface
                   doesn't lend itself to naturally fit in the ReactiveCocoa world

                   Instead, we need to subclass it to ensure that certain things are set
                   at initialization time. That's what this library does.
                   DESC

  s.homepage     = "https://github.com/ashfurrow/RACAlertAction"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Ash Furrow" => "ash@ashfurrow.com" }
  s.social_media_url   = "http://twitter.com/ashfurrow"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ashfurrow/RACAlertAction.git", :tag => s.version }
  s.source_files  = "RACAlertAction.{h,m}"
  s.framework  = "Foundation", "UIKit"
  s.requires_arc = true
  s.dependency "ReactiveCocoa"

end
