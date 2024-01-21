Pod::Spec.new do |s|
  s.name             = 'Venuz'
  s.version          = '0.1.0'
  s.summary          = 'Modular and composable desing system.'
  
  s.swift_version = "5.0"

  s.description      = 'Venuz is a desing system component to create user interfaces with flexibility and style in every composition.'

  s.homepage         = 'https://github.com/PaoloProdossimoLopes/Venuz'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PaoloProdossimoLopes' => 'paolo.prodossimo.lopes@gmail.com' }
  s.source           = { :git => 'https://github.com/PaoloProdossimoLopes/Venuz.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'Venuz/**/*.{swift, json, xcassets}'
  s.resources = [
    'Venuz/**/*.{json, xcassets}',
    'Venuz/UIKit/Media.xcassets'
  ]

#  s.subspec 'Tokens' do |ss|
#    ss.source_files = 'Venuz/Tokens/**/*'
#  end
#  
#  s.subspec 'UIKit' do |ss|
#    ss.source_files = 'Venuz/UIKit/**/*'
#  end
  
  s.dependency 'SwiftLint'
end
