

Pod::Spec.new do |s|


  s.name         = "GDManager"
  s.version      = "0.0.2"
  s.summary      = "this is test summery of GDManager"
  s.description  = "this is test description of GDManager"

  s.homepage     = "https://github.com/niranjan99/GDManager"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "niranjan99" => "vaddepalli.niranjan@gmail.com" }
  
  s.platform     = :ios
  s.platform     = :ios, "10.0"
  s.swift_version = '5.0'
  s.source = {:git => 'https://github.com/niranjan99/GDManager.git', :tag => s.version.to_s}
  s.source_files  = "GDManager/**/*.{swift}"
  s.static_framework = true
  s.resources = "GDManager/Frameworks/*.framework"
   
 # s.preserve_paths = 'GDManager/Frameworks/*.framework'

  s.vendored_frameworks = 'Czm_GenericDevice_DataBaseManagement_Interfaces.framework', 'Czm_GenericDevice_DataBaseManagement.framework', 'Czm_GenericDevice_DataManagement_Interfaces.framework', 'Czm_GenericDevice_DataManagement.framework','Czm_GenericDevice_Infrastructure_Interfaces.framework','Czm_GenericDevice_Infrastructure.framework','DeviceDataManagement_Interfaces.framework','DeviceDataManagement.framework'

   # s.exclude_files = "Classes/Exclude"
   # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

end
