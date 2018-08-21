#
# Be sure to run `pod lib lint PoporIDBankCard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'PoporIDBankCard'
    s.version          = '0.0.1'
    s.summary          = '原来是IDAndBankCard项目(https://github.com/mxl123/IDAndBankCard, 支持银行卡&&身份证扫描识别，返回卡片信息和图片; 先检测.a是否包括所用的设备架构，xcode8上边编译可能会遇到arm64错误，可尝试关闭build setting里边的Enable Testability; 核心.a文件参考BrooksWon/ocr_savingCard; 竖屏扫描，设置AVCaptureConnection的方向就可以了！),但是作者没有组装成cocoapod,用着不是太方便.'
    
    s.homepage         = 'https://github.com/popor/PoporIDBankCard'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'popor' => '908891024@qq.com' }
    s.source           = { :git => 'https://github.com/popor/PoporIDBankCard.git', :tag => s.version.to_s }
    
    s.platform              = :ios
    s.ios.deployment_target = '8.0'
    s.static_framework      = true # 只有真机可运行,.a库不支持虚拟机.
    
    s.subspec 'ScanVC' do |ss|
        ss.source_files = 'PoporIDBankCard/Classes/ScanVC/*.{h,m}'
    end
    s.subspec 'Tool' do |ss|
        ss.source_files = 'PoporIDBankCard/Classes/Tool/*.{h,m}'
    end
    s.subspec 'Views' do |ss|
        ss.source_files = 'PoporIDBankCard/Classes/Views/*.{h,m}'
    end
    
    # 身份证
    s.subspec 'libexidcard' do |ss|
        ss.source_files = 'PoporIDBankCard/Classes/libexidcard/*.{h,a,lib}'
    end
    
    # 银行卡
    s.subspec 'bank_io' do |ss|
        ss.source_files = 'PoporIDBankCard/Classes/bank_io/*.{h,a}'
    end
    
    # 依赖
    s.dependency 'ReactiveCocoa', '~> 2.3.1'
    
end
