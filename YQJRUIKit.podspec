Pod::Spec.new do |s|
    s.name         = 'YQJRUIKit'
    s.version      = '0.0.8'
    s.summary      = '类似于iOS系统的UIKit库'
    s.homepage     = 'https://github.com/JoinPerson/YQJRUIKit'
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.authors      = {'wangzhen' => '867480592@qq.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/JoinPerson/YQJRUIKit.git', :tag => s.version}
    s.source_files = 'YQJRUIKit/Classes/*.{h,m}'
    s.public_header_files = 'YQJRUIKit/Classes/*.h'
end
