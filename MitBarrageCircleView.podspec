Pod::Spec.new do |s|
  s.name             = 'MitBarrageCircleView'
  s.version="0.1.0"
  s.summary          = ' summary of MitBarrageCircleView.'
  s.description      = ' description of MitBarrageCircleView.'
  s.homepage         = 'https://github.com/mcmengchen/MitBarrageCircleView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mcmengchen' => '416922992@qq.com' }
  s.source           = { :git => 'https://github.com/mcmengchen/MitBarrageCircleView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'MitBarrageCircleView/Classes/**/*'
  s.frameworks = 'UIKit', 'Foundation'
end
