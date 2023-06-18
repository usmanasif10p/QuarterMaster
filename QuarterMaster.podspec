Pod::Spec.new do |spec|

  spec.name         = "QuarterMaster"
  spec.version      = "0.0.2"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "https://github.com/usmanasif10p/QuarterMaster"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Usman Asif" => "iusmanasif@gmail.com" }

  spec.ios.deployment_target = "14.1"
  spec.swift_version = "5"

  spec.source        = { :git => "https://github.com/usmanasif10p/QuarterMaster.git", :tag => "#{spec.version}" }
  spec.source_files  = "QuarterMaster/**/*.{h,m,swift}"
  
  spec.dependency 'Alamofire', '~> 5.7'
  spec.dependency 'AlamofireImage', '~> 4.1'
  #spec.dependency 'RealmSwift', '~> 10.39'

end
