Pod::Spec.new do |s|

  s.name = "Localize"
  s.version = "1.2.0"
  s.license = 'MIT'
  s.summary = "Localize strings and UI elements in different languages based in JSON file."
  s.homepage = "https://github.com/Kekiiwaa/Localize"
  s.author = { "Kekiiwaa" => "andresilvagomez@gmail.com" }
  s.source = { :git => "https://github.com/Kekiiwaa/Localize.git", :tag => "1.2.0" }

  s.ios.deployment_target = '8.0'

  s.source_files = "Source/*.swift"

end