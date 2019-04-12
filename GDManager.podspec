

Pod::Spec.new do |s|


  s.name         = "GDManager"
  s.version      = "0.1.0"
  s.summary      = "this is test summery of GDManager"
  s.description  = "this is test description of GDManager"

  s.homepage     = "https://github.com/niranjan99/GDManager"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "niranjan99" => "vaddepalli.niranjan@gmail.com" }
  
  s.platform     = :ios
  s.platform     = :ios, "12.1"
  s.swift_version = '5.0'
  s.source = {:git => 'https://github.com/niranjan99/GDManager.git', :tag => s.version}
  s.source_files  = "GDManager/**/*.swift"
  s.exclude_files = "GDManager/*.plist"
  s.static_framework = true
 # s.preserve_paths = 'GDManager/Frameworks/*.framework'
   s.ios.vendored_frameworks = 'GDManager/Frameworks/Czm_GenericDevice_DataBaseManagement_Interfaces.framework', 'GDManager/Frameworks/Czm_GenericDevice_DataBaseManagement.framework', 'GDManager/Frameworks/Czm_GenericDevice_DataManagement_Interfaces.framework', 'GDManager/Frameworks/Czm_GenericDevice_DataManagement.framework','GDManager/Frameworks/Czm_GenericDevice_Infrastructure_Interfaces.framework','GDManager/Frameworks/Czm_GenericDevice_Infrastructure.framework','GDManager/Frameworks/DeviceDataManagement_Interfaces.framework','GDManager/Frameworks/DeviceDataManagement.framework'

 s.resources = "GDManager/**/*.{storyboard}"
   # s.exclude_files = "Classes/Exclude"
   # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

end
