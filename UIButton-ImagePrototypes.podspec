Pod::Spec.new do |s|
  s.name            = 'UIButton-ImagePrototypes'
  s.author          = { "Dmitry Ponomarev" => "demdxx@gmail.com" }
  s.version         = '0.0.1'
  s.license         = 'MIT'
  s.summary         = 'Software rendering various types of buttons for iOS.'
  s.homepage        = 'https://github.com/demdxx/UIButton-ImagePrototypes'
  s.source          = {:git => 'https://github.com/demdxx/UIButton-ImagePrototypes.git', :tag => 'v0.0.1'}

  s.platform        = :ios
  
  s.source_files    = 'Classes/*.{h,m}'
  s.requires_arc    = false
  
  s.ios.frameworks  = 'Foundation', 'UIKit'
end
