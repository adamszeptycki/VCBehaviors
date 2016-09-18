Pod::Spec.new do |s|
  s.name = 'VCBehaviors'
  s.version = '1.0'
  s.license = 'MIT'
  s.summary = 'Easy way to add common behaviors for UIViewControllers'
  s.homepage = 'https://github.com/adamszeptycki/VCBehaviors'

  s.authors = 'Adam Szeptycki'
  s.source = { :git => 'https://github.com/adamszeptycki/VCBehaviors.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  
  s.framework = "UIKit"
  s.source_files = 'Source/*.swift'
end
