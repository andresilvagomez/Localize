//
//  LocalizeProtocol.swift
//  Localize
//
//  Copyright © 2017 @andresilvagomez.
//

import Foundation

public protocol LocalizeProtocol {

    /// Default language, if this can't find a key in your current language
    /// Try read key in default language
    var defaultLanguage: String {get set}

    /// Storaged language or default language in device
    ///
    /// - returns: storaged language
    var currentLanguage: String {get}

    /// Show all aviable languajes whit criteria name
    ///
    /// - returns: list with storaged languages code
    var availableLanguages: [String] {get}

    // MARK: Localize Methos

    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// That prevent replace untagged values
    ///
    /// - returns: localized key or same text
    func localize(key: String, tableName: String?) -> String

    /// Localize a string using your JSON File
    /// That replace all % character in your string with replace value.
    ///
    /// - parameter value: The replacement value
    ///
    /// - returns: localized key or same text
    func localize(key: String, replace: String, tableName: String?) -> String

    /// Localize a string using your JSON File
    /// That replace each % character in your string with each replace value.
    ///
    /// - parameter value: The replacement values
    ///
    /// - returns: localized key or same text
    func localize(key: String, values replace: [Any], tableName: String?) -> String

    /// Localize string with dictionary values
    /// Get properties in your key with rule :property
    /// If property not exist in this string, not is used.
    ///
    /// - parameter value: The replacement dictionary
    ///
    /// - returns: localized key or same text
    func localize(
        key: String,
        dictionary replace: [String: String],
        tableName: String?) -> String

    // MARK: Config methods

    /// Update default language, this stores a language key which can be retrieved the next time
    func update(language: String)

    /// Update base file name, searched in path.
    func update(fileName: String)

    /// Update the bundle used to load files from.
    func update(bundle: Bundle)

    /// Update default language
    func update(defaultLanguage: String)

    /// This remove the language key storaged.
    func resetLanguage()

    /// Display name for current user language.
    ///
    /// - return: String form language code in current user language
    func displayNameForLanguage(_ language: String) -> String

}
