# JsonLocalizable

JsonLocalizable is a framework writed in swift to localize your projects easier, including storyboards and strings.

![JsonLocalizable Storyboard](https://dl.dropboxusercontent.com/u/72454729/JsonLocalizable/simulator.gif)
___

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Credits](#credits)
- [License](#license)

## Features

- [x] Localize your strings
- [x] Localize your Storyboards without extra files
- [x] Localize your UIView components without xcode UIView ids
- [x] Localize your UIView components only with keys
- [x] Localize your UIView components with classes
- [x] Update your current language and update all view components
- [x] Update your current language and receive notification

## Requirements

- iOS 8.0+ 
- Xcode 8.0+
- Swift 3.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build JsonLocalizable 1.0+.

To integrate JsonLocalizable into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'JsonLocalizable' , '~> 1.1'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate JsonLocalizable into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Kekiiwaa/JsonLocalizable"
```

Run `carthage update` to build the framework and drag the built `JsonLocalizable.framework` into your Xcode project.

### Swift Pacakge Manager

The [Swift Pacakage Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding JsonLocalizable as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .Package(url: "https://github.com/Kekiiwaa/JsonLocalizable.git")
]
```

---

## Usage

### Config
This not is necesary, only if you need diferent results.

```swift
// AppDelegate.swift

import JsonLocalizable

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    let localize = Localizable.shared
    // Set your file name
    localize.fileName = "myFileName"
    // Set your default languaje.
    localize.defaultLanguage = .french
    // If you want change a user language different to default in device, use this method.
    localize.update(language: .english)
    // If you want remove storaged languaje, use
    localize.resetLanguage()
    // The used language that you configured to localize
    print(localize.language())
    // List of storaged languajes
    print(localize.languages())
    // List of aviable languajes
    print(localize.availableLanguages())
    
    return true
}

```

### Create your json file

Please create a JSON file in your code with this rule: 

```
{your file name}-{your lang code}.json
```

For example

- lang-en.json
- lang-es.json
- lang-fr.json

Example JSON File

```
{
    "hello" : {
        "world" : "Hello world!",
        "name" : "Hello %!"
    },
    "values" : "Hello % we are %, see you soon",
    "username" : "My username is :username",
    "navigation.title" : ""
}
```

### Localize strings

```swift

print( "hello.world".localize() )

// Hello world!

```

### Localize strings, replacing text
JsonLocalizable use `%` identifier to replace the text

```swift

print( "hello.name".localize(value: "everyone") )

// Hello everyone!

```

### Localize strings, replacing many texts
JsonLocalizable use `%` identifier to replace the text

```swift

print( "values".localize(values: "everyone", "Software Developer") )

// Hello everyone we are Software Developer, see you soon

```

### Localize strings, replacing dictionary values
JsonLocalizable use `:yourid` to search your id in JSON File

```swift

print( "username".localize(dictionary: ["username": "JsonLocalizable"]) )

// My username is JsonLocalizable

```

---

### Localize your storyboard with extensions
You don't need import anything in your code, JsonLocalizable use extensions to localize your UIView components

```
// This is lang-en.json
{
    "navigation" : {
        "title" : "JsonLocalizable"
    },
    "app" : {
        "label" : "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.",
        "textfield" : "Write some here."
    }
}
```

![JsonLocalizable Storyboard](https://dl.dropboxusercontent.com/u/72454729/JsonLocalizable/storyboard.png?raw=1)

This is the result in your simulator

![JsonLocalizable Simulator](https://dl.dropboxusercontent.com/u/72454729/JsonLocalizable/simulator.png?raw=1)

You can use extensions for 

- ``` UIBarButtonItem ```
- ``` UIButton ```
- ``` UILabel ```
- ``` UINavigationItem ```
- ``` UISearchBar ```
- ``` UISegmentedControl ```
- ``` UITabBarItem ```
- ``` UITextField ```
- ``` UITextView ```

---

### Localize your storyboard with classes
You don't need import anything in your code, JsonLocalizable use extensions to localize your UIView components

```
// This is lang-en.json
{
    "navigation" : {
        "title" : "JsonLocalizable"
    },
    "app" : {
        "label" : "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.",
        "textfield" : "Write some here."
    }
}
```

![JsonLocalizable Storyboard](https://dl.dropboxusercontent.com/u/72454729/JsonLocalizable/classes.png?raw=1)

This is the result in your simulator

![JsonLocalizable Simulator](https://dl.dropboxusercontent.com/u/72454729/JsonLocalizable/simulator2.png?raw=1)

You can use this classes

- ``` LocalizableBarButtonItem ```
- ``` LocalizableButton ```
- ``` LocalizableLabel ```
- ``` LocalizableNavigationBarItem ```
- ``` LocalizableSearchBar ```
- ``` LocalizableSegmentedControler ```
- ``` LocalizableBarItem ```
- ``` LocalizableTextField ```
- ``` LocalizableTextView ```

---

## Updating language
When you change a language, automatically all views update your content to new language

```swift

let localize = Localize.shared
localize.update(language: .french)

```

But with strings not is posible, for that your need implement a notification

```swift

override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)   
}

public func localize() {
    yourLabel.text = "app.names".localize(values: "mark", "henrry", "peater")
    otherLabel.text = "app.username".localize(value: "Your username")
}

```

Implementing internal acction to change a language

```swift

@IBAction func updateLanguage(_ sender: Any) {
    let actionSheet = UIAlertController(title: nil, message: "app.update.language".localize(), preferredStyle: UIAlertControllerStyle.actionSheet)
    for language in Localizable.shared.availableLanguages() {
        let displayName = Localizable.shared.displayNameForLanguage(language)
        let languageAction = UIAlertAction(title: displayName, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            Localizable.shared.update(language: language)
            })
        actionSheet.addAction(languageAction)
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {
        (alert: UIAlertAction) -> Void in
        })
    actionSheet.addAction(cancelAction)
    self.present(actionSheet, animated: true, completion: nil)
}

```

---

## Credits

[Kekiiwaa Inc](https://github.com/Kekiiwaa), 
[Andres Silva Gomez](https://github.com/andresilvagomez),
[Andres Felipe Montoya](https://github.com/pipemontoya)

## License

JsonLocalizable is released under the MIT license. See LICENSE for details.
