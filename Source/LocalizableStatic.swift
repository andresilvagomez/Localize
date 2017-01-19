//
//  Localizable-Static.swift
//  JsonLocalizable
//
//  Copyright © 2017 Mobility. All rights reserved.
//

import UIKit

extension Localizable {
    
    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// That prevent replace untagged values
    ///
    /// - returns: localized key or same text
    public static func localize(key:String) -> String {
        return Localizable.shared.localize(key: key)
    }
    
    /// Localize a string using your JSON File
    /// That replace all % character in your string with replace value.
    ///
    /// - parameter value: The replacement value
    ///
    /// - returns: localized key or same text
    public static func localize(key:String, replace:String) -> String {
        return Localizable.shared.localize(key: key, replace: replace)
    }
    
    /// Localize a string using your JSON File
    /// That replace each % character in your string with each replace value.
    ///
    /// - parameter value: The replacement values
    ///
    /// - returns: localized key or same text
    public static func localize(key:String, values replace:[Any]) -> String {
        return Localizable.shared.localize(key: key, values: replace)
    }
    
    /// Localize string with dictionary values
    /// Get properties in your key with rule :property
    /// If property not exist in this string, not is used.
    ///
    /// - parameter value: The replacement dictionary
    ///
    /// - returns: localized key or same text
    public static func localize(key:String, dictionary replace:[String:String]) -> String {
        return Localizable.shared.localize(key: key, dictionary: replace)
    }
    
    /// Return storaged language or default language in device
    ///
    /// - returns: current used language
    public static func language() -> String {
        return Localizable.shared.language()
    }
    
    /// Update default languaje, this store a language key and retrive the next time
    public static func update(language:Languages) {
        return Localizable.shared.update(language: language)
    }
    
    /// Update default languaje, this store a language key and retrive the next time
    public static func update(language string:String) {
        return Localizable.shared.update(language: string)
    }
    
    /// Update base file name, searched in path.
    public static func update(fileName:String) {
        return Localizable.shared.update(fileName: fileName)
    }
    
    /// Update default language
    public static func update(defaultLanguage: Languages) {
        return Localizable.shared.update(defaultLanguage: defaultLanguage)
    }
    
    /// This remove the language key storaged.
    public static func resetLanguage() {
        return Localizable.shared.resetLanguage()
    }
    
    /// Show all aviable languajes whit criteria name
    ///
    /// - returns: list with storaged languages code
    public static func availableLanguages() -> [String] {
        return Localizable.shared.availableLanguages()
    }
    
    /// Display name for current user language.
    ///
    /// - return: String form language code in current user language
    public static func displayNameForLanguage(_ language: String) -> String {
        return Localizable.shared.displayNameForLanguage(language)
    }
    
}
