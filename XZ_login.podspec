Pod::Spec.new do |s|

  s.name         = "XZ_login"
  s.version      = "0.0.2"
  s.summary      = "登录模块"

  #s.description  = <<-DESC
  #"登录模块，包括注册，登录，忘记密码"

  s.homepage     = "https://github.com/Jason-zzzz/XZ_login"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

    s.license      = "MIT"

  s.author             = { "Zhaojinsong" => "214171891@qq.com" }

    s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/Jason-zzzz/XZ_login.git", :tag => s.version.to_s }

  s.source_files  = "XZ_login/Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

    s.public_header_files = "XZ_login/Classes/**/*.h"

  # s.resource  = "icon.png"
    s.resources = "XZ_login/Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  # s.dependency "HandyFrame"
  # s.dependency "ZZNavigation"

end
