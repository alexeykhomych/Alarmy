# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'Alarmy' do
  pod 'IQKeyboardManagerSwift'
  pod "IDPRootViewGettable", :git => 'https://github.com/idapgroup/IDPRootViewGettable.git'
  use_frameworks!
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
  end