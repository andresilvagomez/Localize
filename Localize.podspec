Pod::Spec.new do |s|

  s.name = "Localize"
  s.version = "1.3.0"
  s.license = 'MIT'
  s.summary = "Localize is a framework writed in swift to localize your projects easier improves i18n, including storyboards and strings."
  s.homepage = "https://github.com/Kekiiwaa/Localize"
  s.author = { "Kekiiwaa" => "andresilvagomez@gmail.com" }
  s.source = { :git => "https://github.com/Kekiiwaa/Localize.git", :tag => "1.3.0" }

  s.ios.deployment_target = '8.0'
  s.source_files = "Source/*.swift"

end