# Check list
# git pull
# change s.version
# pod lib lint EZAlertController.podspec
# git tag <New Tag>
# git add & git commit
# git push
# pod spec lint EZAlertController.podspec
# pod trunk push EZAlertController.podspec

Pod::Spec.new do |s|
s.name             = "EZAlertController"
s.version          = "0.1"
s.summary          = "Easy Swift UIAlertController"
s.description      = "Easy Swift UIAlertController with only one line"
s.homepage         = "https://github.com/thellimist/EZAlertController"
s.license          = 'MIT'
s.author           = { "thellimist" => "mufuyil@gmail.com" }
s.source           = { :git => "https://github.com/thellimist/EZAlertController.git", :tag => s.version.to_s }
s.platform     = :ios, '8.0'
s.requires_arc = true
s.source_files = 'EZAlertController.swift'

end
