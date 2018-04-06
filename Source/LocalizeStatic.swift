//
//  LocalizableStatic.swift
//  Localize
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import UIKit

extension Localize {
    
    /// Show all aviable languajes whit criteria name
    ///
    /// - returns: list with storaged languages code
    public static var availableLanguages: [String] {
        return Localize.shared.availableLanguages
    }
    
    /// Return storaged language or default language in device
    ///
    /// - returns: current used language
    public static var currentLanguage: String {
        return Localize.shared.currentLanguage
    }
    
    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// That prevent replace untagged values
    ///
    /// - returns: localized key or same text
    public static func localize(key:String, tableName:String? = nil) -> String {
        return Localize.shared.localize(key: key, tableName: tableName)
    }
    
    /// Localize a string using your JSON File
    /// That replace all % character in your string with replace value.
    ///
    /// - parameter value: The replacement value
    ///
    /// - returns: localized key or same text
    public static func localize(key:String, replace:String, tableName:String? = nil) -> String {
        return Localize.shared.localize(key: key, replace: replace, tableName: tableName)
    }
    
    /// Localize a string using your JSON File
    /// That replace each % character in your string with each replace value.
    ///
    /// - parameter value: The replacement values
    ///
    /// - returns: localized key or same text
    public static func localize(key:String, values replace:[Any], tableName:String? = nil) -> String {
        return Localize.shared.localize(key: key, values: replace, tableName: tableName)
    }
    
    /// Localize string with dictionary values
    /// Get properties in your key with rule :property
    /// If property not exist in this string, not is used.
    ///
    /// - parameter value: The replacement dictionary
    ///
    /// - returns: localized key or same text
    public static func localize(key:String, dictionary replace:[String:String], tableName:String? = nil) -> String {
        return Localize.shared.localize(key: key, dictionary: replace, tableName: tableName)
    }
    
    /// Update default language, this stores a language key which can be retrieved the next time
    public static func update(language: String) {
        return Localize.shared.update(language: language)
    }
    
    /// Update base file name, searched in path.
    public static func update(fileName:String) {
        return Localize.shared.update(fileName: fileName)
    }
    
    /// Update the bundle used to load files from.
    public static func update(bundle: Bundle) {
        return Localize.shared.update(bundle: bundle)
    }

    /// Update default language
    public static func update(defaultLanguage: String) {
        return Localize.shared.update(defaultLanguage: defaultLanguage)
    }
    
    /// This remove the language key storaged.
    public static func resetLanguage() {
        return Localize.shared.resetLanguage()
    }
    
    /// Display name for current user language.
    ///
    /// - return: String form language code in current user language
    public static func displayNameForLanguage(_ language: String) -> String {
        return Localize.shared.displayNameForLanguage(language)
    }
    
    /// Enable testing mode
    /// Please not use in your code, is only for test schema.
    public static func testingMode() {
        Localize.shared.testingMode()
    }
    
    // MARK: Config providers
    
    /// Update provider to localize your app.
    public static func update(provider: LocalizeType) {
        Localize.shared.update(provider: provider)
    }
    
}
