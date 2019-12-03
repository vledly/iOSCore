#
#  Be sure to run `pod spec lint UBCore.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "UBCore"

  spec.version      = "1.2.3"

  spec.summary      = "UnitBean iOS Core Framework."
  
  spec.homepage     = "https://unitbean.ru"

  spec.description  = "UnitBean iOS Core Framework. Includes wrapped Moya network stack, RealmDAO and Reachability."

  spec.license = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Levan Chikvaidze" => "levan.chikvaidze@unitbean.com" }
  
  spec.platform     = :ios, "10.0"

  spec.source =  { :git => 'https://github.com/unitbean/iOSCore.git', :tag => spec.version }

  spec.source_files  = "UBCore", "UBCore/*.{swift,h,m}"

  spec.exclude_files = "UBCore/UBCore/UBCore-umbrella.h"

  spec.swift_version = '5.0'

  spec.framework = "Foundation"

  spec.dependency 'Moya', '14.0.0-beta.5'
  
  spec.dependency 'ReachabilitySwift', '~> 5.0'
  
  spec.dependency 'DAO/Realm'

end
