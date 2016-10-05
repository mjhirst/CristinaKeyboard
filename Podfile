source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/artsy/Specs.git'
platform :ios, '8.1'
use_frameworks!

def shared_pods
    pod 'Firebase/Core’
    pod 'Firebase/Database'
    pod 'Firebase/Auth'
end

target 'ChristinaKeyboard' do
    shared_pods
    pod 'Alamofire', '~> 3.4'
    pod 'SwiftyJSON', :git => 'https://github.com/SwiftyJSON/SwiftyJSON.git', :branch => 'swift2'
    pod 'Batch', '~> 1.5'
end

target 'CKeyboard' do
    shared_pods
end

post_install do |installer|
    system "sed -i '' -E 's/EMBEDDED_CONTENT_CONTAINS_SWIFT[[:space:]]=[[:space:]]YES/EMBEDDED_CONTENT_CONTAINS_SWIFT = NO/g' Pods/Target\\ Support\\ Files/Pods-LibraryTargetName/*.xcconfig"
end
