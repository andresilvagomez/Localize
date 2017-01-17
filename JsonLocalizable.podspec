Pod::Spec.new do |s|

  s.name = "JsonLocalizable"
  s.version = "1.1"
  s.license = 'MIT'
  s.summary = "Localize strings and UI elements in different languages based in JSON file."
  s.homepage = "https://github.com/Kekiiwaa/JsonLocalizable"
  s.author = { "Kekiiwaa" => "andresilvagomez@gmail.com" }
  s.source = { :git => "https://github.com/Kekiiwaa/JsonLocalizable.git", :tag => "1.1" }

  s.ios.deployment_target = '8.0'

  s.source_files = "Source/*.swift"

end