//
//  LocalizeProtocol.swift
//  Localize
//
//  Copyright © 2017 Kekkiwaa. All rights reserved.
//

import UIKit

protocol LocalizeProtocol {
    
    /// Use this for testing mode, search resources in different bundles.
    var testing: Bool {get set}
    
    /// Default language, if this can't find a key in your current language
    /// Try read key in default language
    var defaultLanguage: Languages {get set}
    
    
    /// MARK: Localize Methos
    
    
    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// That prevent replace untagged values
    ///
    /// - returns: localized key or same text
    func localize(key:String, tableName:String?) -> String
    
    /// Localize a string using your JSON File
    /// That replace all % character in your string with replace value.
    ///
    /// - parameter value: The replacement value
    ///
    /// - returns: localized key or same text
    func localize(key:String, replace:String, tableName:String?) -> String
    
    /// Localize a string using your JSON File
    /// That replace each % character in your string with each replace value.
    ///
    /// - parameter value: The replacement values
    ///
    /// - returns: localized key or same text
    func localize(key:String, values replace:[Any], tableName:String?) -> String
    
    /// Localize string with dictionary values
    /// Get properties in your key with rule :property
    /// If property not exist in this string, not is used.
    ///
    /// - parameter value: The replacement dictionary
    ///
    /// - returns: localized key or same text
    func localize(key:String, dictionary replace:[String:String], tableName:String?) -> String
    
    
    // MARK: Config methods
    
    
    /// Return storaged language or default language in device
    ///
    /// - returns: current used language
    func language() -> String
    
    /// Update default languaje, this store a language key and retrive the next time
    func update(language:Languages) -> Void
    
    /// Update default languaje, this store a language key and retrive the next time
    func update(language string:String) -> Void
    
    /// Update base file name, searched in path.
    func update(fileName:String)
    
    /// Update default language
    func update(defaultLanguage: Languages)
    
    /// This remove the language key storaged.
    func resetLanguage() -> Void
    
    /// Show all aviable languajes whit criteria name
    ///
    /// - returns: list with storaged languages code
    func availableLanguages() -> [String]
    
    /// Display name for current user language.
    ///
    /// - return: String form language code in current user language
    func displayNameForLanguage(_ language: String) -> String
    
    /// Enable testing mode
    /// Please not use in your code, is only for test schema.
    func testingMode()
    
}
