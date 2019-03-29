Pod::Spec.new do |s|

  s.name = "Localize"
  s.version = "2.2.0"
  s.license = 'MIT'
  s.summary = "Localize is a framework writed in swift to localize your projects easier improves i18n, including storyboards and strings."
  s.homepage = "https://github.com/andresilvagomez/Localize"
  s.author = { "Andres Silva" => "me@andresilvagomez.com" }
  s.source = { :git => "https://github.com/andresilvagomez/Localize.git", :tag => "2.2.0" }

  s.ios.deployment_target = '9.0'
  s.source_files = "Source/*.swift"

  s.test_spec 'Localize' do |test_spec|
    test_spec.source_files = 'Tests/*.swift'
    test_spec.resources = 'Tests/*.{json,lproj,strings}'
  end 

end
