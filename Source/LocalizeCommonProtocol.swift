//
//  LocalizeCommonProtocol.swift
//  Localize
//
//  Copyright © 2017 Kekiiwaa. All rights reserved.
//

import UIKit

class LocalizeCommonProtocol: NSObject {
    
    /// Name for storaged Json Files
    /// The rule for name is fileName-LanguageKey.json
    public var fileName = "lang"

    /// Bundle used to load files from.
    /// Defaults to the main bundle.
    public var usedBundle: Bundle = Bundle.main

    /// Use this for testing mode, search resources in different bundles.
    var testing: Bool = false
    
    /// Default language, if this can't find a key in your current language
    /// Try read key in default language
    public var defaultLanguage: Languages = .english
    
    /// Determinate if your interface localization is based on LocalizeInterface
    public var localizableInterface: LocalizeInterface = .boot
    
    /// Storaged language or default language in device
    public var currentLanguage: Languages {
        get {
            return Languages(rawValue: self.language())!
        }
    }
    
    // MARK: Internal methods.
    
    // Interator for String Enumerators
    internal func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
        var i = 0
        return AnyIterator {
            let next = withUnsafePointer(to: &i) {
                $0.withMemoryRebound(to: T.self, capacity: 1) { $0.pointee }
            }
            if next.hashValue != i { return nil }
            i += 1
            return next
        }
    }
    
    /// Path for your env
    /// if testing mode is enable we change the bundle
    /// in other case use a main bundle.
    ///
    /// - returns: a string url where is your file
    internal func bundle() -> Bundle {
        if self.testing {
            return Bundle(for: type(of: self))
        }
        return usedBundle
    }
    
    
    // MARK: Public methods
    
    
    /// Update default languaje, this store a language key and retrive the next time
    public func update(language:Languages) -> Void {
        let defaults = UserDefaults.standard
        defaults.setValue(language.rawValue, forKey: LocalizeStorageKey)
        defaults.synchronize()
        NotificationCenter.default.post(name: Notification.Name(rawValue: LocalizeChangeNotification), object: nil)
    }
    
    /// Update default languaje, this store a language key and retrive the next time
    public func update(language string:String) -> Void {
        guard let language = Languages(rawValue: string) else {
            return
        }
        return self.update(language: language)
    }
    
    /// Update default language
    public func update(defaultLanguage: Languages) {
        self.defaultLanguage = defaultLanguage
    }
    
    /// This remove the language key storaged.
    public func resetLanguage() -> Void {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: LocalizeStorageKey)
        defaults.synchronize()
    }
    
    /// Display name for current user language.
    ///
    /// - return: String form language code in current user language
    public func displayNameForLanguage(_ language: String) -> String {
        let locale : NSLocale = NSLocale(localeIdentifier: self.currentLanguage.rawValue)
        if let name = locale.displayName(forKey: NSLocale.Key.identifier, value: language) {
            return name.capitalized
        }
        return ""
    }
    
    /// Enable testing mode
    /// Please not use in your code, is only for test schema.
    public func testingMode() {
        self.testing = true
    }
    
    /// Return storaged language or default language in device
    ///
    /// - returns: current used language
    public func language() -> String {
        let defaults = UserDefaults.standard
        if let lang = defaults.string(forKey: LocalizeStorageKey) {
            return lang
        }
        return Locale.preferredLanguages[0].components(separatedBy: "-")[0]
    }
    
    /// Update base file name, searched in path.
    public func update(fileName:String) {
        self.fileName = fileName
    }
    
    /// Update the bundle used to load files from.
    public func update(bundle: Bundle) {
        self.usedBundle = bundle
    }

    // MARK: Localize methods.
    
    
    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// That prevent replace untagged values
    ///
    /// - returns: localized key or same text
    public func localize(key: String, tableName:String? = nil) -> String {
        return ""
    }
    
    /// Localize a string using your JSON File
    /// That replace all % character in your string with replace value.
    ///
    /// - parameter value: The replacement value
    ///
    /// - returns: localized key or same text
    public func localize(key:String, replace:String, tableName:String? = nil) -> String {
        let string = self.localize(key: key, tableName:tableName)
        if string == key {
            return key
        }
        return string.replacingOccurrences(of: "%", with: replace)
    }
    
    /// Localize a string using your JSON File
    /// That replace each % character in your string with each replace value.
    ///
    /// - parameter value: The replacement values
    ///
    /// - returns: localized key or same text
    public func localize(key:String, values replace:[Any], tableName:String? = nil) -> String {
        var string = self.localize(key: key, tableName:tableName)
        if string == key {
            return key
        }
        var array = string.components(separatedBy: "%")
        string = ""
        _ = replace.count + 1
        for (index, element) in replace.enumerated() {
            if index < array.count {
                let new = array.remove(at: 0)
                string = index == 0 ? "\(new)\(element)" : "\(string)\(new)\(element) "
            }
        }
        string += array.joined(separator: "")
        string = string.replacingOccurrences(of: "  ", with: " ")
        return string
    }
    
    /// Localize string with dictionary values
    /// Get properties in your key with rule :property
    /// If property not exist in this string, not is used.
    ///
    /// - parameter value: The replacement dictionary
    ///
    /// - returns: localized key or same text
    public func localize(key:String, dictionary replace:[String:String], tableName:String? = nil) -> String {
        var string = self.localize(key: key, tableName:tableName)
        for (key, value) in replace {
            string = string.replacingOccurrences(of: ":\(key)", with: value)
        }
        return string
    }
    
}
