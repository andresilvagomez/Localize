Pod::Spec.new do |s|

  s.name = "JsonLocalizable"
  s.version = "1.0"
  s.license = 'MIT'
  s.summary = "Localize strings and UIElements in different languages."
  s.homepage = "https://github.com/Kekiiwaa/JsonLocalizable"
  s.author = { "Kekiiwaa" => "andresilvagomez@gmail.com" }
  s.source = { :git => "https://github.com/Kekiiwaa/JsonLocalizable.git", :tag => "1.0" }

  s.ios.deployment_target = '10.0'

  s.source_files = "Source/*.swift"

end