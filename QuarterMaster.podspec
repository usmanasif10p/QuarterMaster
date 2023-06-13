Pod::Spec.new do |spec|

  spec.name         = "QuarterMaster"
  spec.version      = "0.0.1"
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

end
