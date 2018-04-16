//
//  LocalizeJson.swift
//  Localize
//
//  Copyright © 2017 Kekiiwaa. All rights reserved.
//

import UIKit

fileprivate typealias JSON = NSDictionary

fileprivate extension JSON {
    /// This method has path where file is
    /// If can't find a path return a nil value
    /// If can't serialize data return a nil value
    static func read(bundle: Bundle, named name: String) -> JSON? {
        guard let path = bundle.path(forResource: name, ofType: "json") else {
            return nil
        }
        let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        do {
            return try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
        }
        catch {
            print("Localize can't parse your file", error)
        }
        return nil
    }
    
    /// Try search key in your dictionary using single level
    /// If it doesn't find the key it will use the multilevel
    /// If the key not exis in your JSON return nil value
    func valueFor(key: String) -> String? {
        if let string = self[key] {
            return string as? String
        }
        
        if let string = valueForKeyInLevels(key: key) {
            return string
        }
        
        return nil
    }
    
    /// Try search key in your dictionary using multiples levels
    /// It is necessary that the result be a string
    /// Otherwise it returns nil value
    private func valueForKeyInLevels(key: String) -> String? {
        let values = key.components(separatedBy: ".")
        var jsonCopy: AnyObject? = self as AnyObject
        for key in values {
            if let result = jsonCopy?[key] {
                jsonCopy = result as AnyObject?
            } else {
                return nil
            }
        }
        
        return jsonCopy as? String
    }
}

class LocalizeJson: LocalizeCommonProtocol {

    /// Create default lang name
    override init() {
        super.init()
        fileName = "lang"
    }
    
    /// Show all aviable languages with criteria name
    ///
    /// - returns: list with storaged languages code
    override var availableLanguages: [String] {
        var languages : [String] = []
        
        for localeId in NSLocale.availableLocaleIdentifiers {
            let name = "\(fileName)-\(localeId)"
            let path = bundle.path(forResource: name, ofType: "json")
            if path != nil {
                languages.append(localeId)
            }
        }
        
        return languages
    }
    
    // MARK: Read JSON methods
    
    /// This metod contains a logic to read return JSON data
    /// If JSON not is defined, this try use a default
    /// As long as the default language is the same as the current one.
    private func readJSON(tableName: String? = nil) -> JSON? {
        let tableName = tableName ?? fileName
        var lang = currentLanguage
        var json = JSON.read(bundle: bundle, named: "\(tableName)-\(lang)")
        
        if json != nil {
            return json
        }
        
        lang = lang.components(separatedBy: "-")[0]
        json = JSON.read(bundle: bundle, named: "\(tableName)-\(lang)")
        
        if json == nil && lang != defaultLanguage {
            json = readDefaultJSON()
        }
        
        return json
    }
    
    /// Read a JSON with default language value.
    ///
    /// - returns: json or nil value.
    private func readDefaultJSON(tableName: String? = nil) -> JSON? {
        let tableName = tableName ?? fileName
        return JSON.read(bundle: bundle, named: "\(tableName)-\(defaultLanguage)")
    }
    
    // MARK: Public methods
    
    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// That prevent replace untagged values
    ///
    /// - returns: localized key or same text
    public override func localize(key: String, tableName: String? = nil) -> String {
        guard let json = readJSON(tableName: tableName) else {
            return key
        }
        
        let string = json.valueFor(key: key)
        if string != nil {
            return string!
        }
        
        guard let defaultJSON = readDefaultJSON(tableName: tableName) else {
            return key
        }
        
        let defaultString = defaultJSON.valueFor(key: key)
        if defaultString != nil {
            return defaultString!
        }
        
        return key
    }
}
