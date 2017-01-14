//
//  Localizable-Swift.swift
//  JsonLocalizable
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import UIKit

public enum LocalizableInterface {
    case keyValue
    case classes
    case boot
}

public class Localizable: NSObject {
    
    private let storageKey = "localizable.swift.language"
    
    private var json : NSDictionary?
    
    public static let shared : Localizable = Localizable()
    
    public var fileName = "lang"
    
    public var defaultLanguage : Languages = .english
    
    public var localizableInterface : LocalizableInterface = .boot
    
    
    private override init() {
        super.init()
    }
    
    // MARK: Read JSON methods

    fileprivate func readJSON() -> NSDictionary? {
        if self.json != nil {
            return self.json
        }
        
        let lang = self.language()
        
        self.json = self.readJSON(named: "\(self.fileName)-\(lang)")
        
        if self.json == nil && lang != self.defaultLanguage.rawValue {
            self.json = self.readJSON(named: "\(self.fileName)-\(self.defaultLanguage.rawValue)")
        }
        
        return self.json
    }
    
    fileprivate func readJSON(named name:String) -> NSDictionary? {
        let path = Bundle.main.path(forResource: name, ofType: "json")
        if path == nil {
            return nil
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path!)) else {
            print("JSONLocalizable can't read your file")
            return nil
        }
        do {
            return try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
        }
        catch {
            print("JSONLocalizable can't parse your file")
            return nil
        }
    }
    
    // MARK: Config methods
    
    public func language() -> String {
        let defaults = UserDefaults.standard
        if let lang = defaults.string(forKey: self.storageKey) {
            return lang
        }
        return Locale.preferredLanguages[0].components(separatedBy: "-")[0]
    }
    
    public func update(language:Languages) -> Void {
        let defaults = UserDefaults.standard
        defaults.setValue(language.rawValue, forKey: self.storageKey)
        defaults.synchronize()
    }
    
    public func resetLanguage() -> Void {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: self.storageKey)
        defaults.synchronize()
    }
    
    
    // MARK: Private methods
    
    private func localizeFile(key:String, json:NSDictionary) -> String? {
        if let string = json[key] {
            return string as? String
        }
        
        if let string = self.localizeLevel(key: key, json: json) {
            return string
        }
        
        return nil
    }
    
    private func localizeLevel(key: String, json:AnyObject?) -> String? {
        let values = key.components(separatedBy: ".")
        var jsonCopy = json
        for key in values {
            if let result = jsonCopy?[key] {
                jsonCopy = result as AnyObject?
            } else {
                return nil
            }
        }
        return jsonCopy as? String
    }
    
    // MARK: Private methods
    
    public func localize(key:String) -> String {
        guard let json = self.readJSON() else {
            return key
        }
        
        if let string = self.localizeFile(key: key, json: json) {
            return string
        }
        
        return key
    }
    
    public func localize(key:String, replace:String) -> String {
        var string = self.localize(key: key)
        string = string.replacingOccurrences(of: "%", with: replace)
        return string
    }
    
    public func localize(key:String, values replace:[Any]) -> String {
        var string = self.localize(key: key)
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
    
    public func localize(key:String, dictionary replace:[String:String]) -> String {
        var string = self.localize(key: key)
        for (key, value) in replace {
            string = string.replacingOccurrences(of: ":\(key)", with: value)
        }
        return string
    }
    
}
