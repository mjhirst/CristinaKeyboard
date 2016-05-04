source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/artsy/Specs.git'
platform :ios, '8.1'
use_frameworks!

def shared_pods
    pod 'Firebase', '>= 2.5.1'
    pod 'SwiftyBeaver'
end

target 'ChristinaKeyboard' do
    shared_pods
    pod 'Alamofire', '~> 2.0'
    pod 'SwiftyJSON', :git => 'https://github.com/SwiftyJSON/SwiftyJSON.git'
    pod 'Batch', '~> 1.5'
end

target 'CKeyboard' do
    shared_pods
end
