//
//  LocalizeSwift.swift
//  Localize
//
//  Copyright © 2019 @andresilvagomez.
//

import Foundation

/// Name for language change notification
public let localizeChangeNotification = "LocalizeChangeNotification"

/// Internal current language key
public let localizeStorageKey = "LocalizeDefaultLanguage"

/// Different types to localize your app, using json files or strings default by Apple.
public enum LocalizeType {
    /// Custom localize protocol.
    case json
    /// Default Apple protocol.
    case strings
    // Custom provider
    case custom(provider: LocalizeProtocol)
}

/// Is a pricipal class, contents all logic to localize your keys
/// read json and determinate all configurations.
public class Localize: NSObject {

    // MARK: Properties

    /// Shared instance
    public static let shared: Localize = Localize()

    /// Provider to localize your app.
    private var provider: LocalizeProtocol = LocalizeStrings()

    /// Show all aviable languajes whit criteria name
    ///
    /// - returns: list with storaged languages code
    public var availableLanguages: [String] {
        return provider.availableLanguages
    }

    /// Return storaged language or default language in device
    ///
    /// - returns: current used language
    public var currentLanguage: String {
        return provider.currentLanguage
    }

    // MARK: Public methods

    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// That prevent replace untagged values
    ///
    /// - returns: localized key or same text
    public func localize(key: String, tableName: String? = nil) -> String {
        return provider.localize(key: key, tableName: tableName)
    }

    /// Localize a string using your JSON File
    /// That replace all % character in your string with replace value.
    ///
    /// - parameter value: The replacement value
    ///
    /// - returns: localized key or same text
    public func localize(
        key: String,
        replace: String,
        tableName: String? = nil) -> String {

        return provider.localize(key: key, replace: replace, tableName: tableName)
    }

    /// Localize a string using your JSON File
    /// That replace each % character in your string with each replace value.
    ///
    /// - parameter value: The replacement values
    ///
    /// - returns: localized key or same text
    public func localize(
        key: String,
        values: [Any],
        tableName: String? = nil) -> String {

        return provider.localize(key: key, values: values, tableName: tableName)
    }

    /// Localize string with dictionary values
    /// Get properties in your key with rule :property
    /// If property not exist in this string, not is used.
    ///
    /// - parameter value: The replacement dictionary
    ///
    /// - returns: localized key or same text
    public func localize(
        key: String,
        dictionary: [String: String],
        tableName: String? = nil) -> String {

        return provider.localize(key: key, dictionary: dictionary, tableName: tableName)
    }

    // MARK: Config methods

    /// Update default language, this stores a language key which can be retrieved the next time
    public func update(language: String) {
        provider.update(language: language)
    }

    /// Update base file name, searched in path.
    public func update(fileName: String) {
        provider.update(fileName: fileName)
    }

    /// Update the bundle used to load files from.
    public func update(bundle: Bundle) {
        provider.update(bundle: bundle)
    }

    /// Update default language
    public func update(defaultLanguage: String) {
        provider.update(defaultLanguage: defaultLanguage)
    }

    /// This remove the language key storaged.
    public func resetLanguage() {
        provider.resetLanguage()
    }

    /// Display name for current user language.
    ///
    /// - return: String form language code in current user language
    public func displayNameForLanguage(_ language: String) -> String {
        return provider.displayNameForLanguage(language)
    }

    /// Determines whether a localized string exists for given key
    ///
    /// - parameter key: localization key
    /// - returns: boolean value determining whether a localized string exists for give key
    public func localizeExists(forKey key: String, table: String? = nil) -> Bool {
        guard let table = table else {
            return key.localized != key
        }
        return key.localize(tableName: table) != key
    }

    // MARK: Config providers

    /// Update provider to localize your app.
    public func update(provider: LocalizeType) {
        switch provider {
        case .json:
            self.provider = LocalizeJson()
        case .strings:
            self.provider = LocalizeStrings()
        case .custom(let provider):
            self.provider = provider
        }
    }
}
