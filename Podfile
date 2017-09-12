platform :ios, '9.0'
use_frameworks!

target 'TwitterStream' do
  pod 'Texture'
end

target 'Tests' do
  pod 'Texture'
  pod 'FBSnapshotTestCase'
  pod 'Quick'
  pod 'Nimble'
end

post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
        end
    end
end
