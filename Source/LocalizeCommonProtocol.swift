//
//  LocalizeCommonProtocol.swift
//  Localize
//
//  Copyright © 2019 @andresilvagomez.
//

import Foundation

/// Provide a default functionality.
open class LocalizeCommonProtocol: LocalizeProtocol {

    /// Empty Init
    public init() {

    }

    /// Show all aviable languajes whit criteria name
    ///
    /// - returns: list with storaged languages code
    open var availableLanguages: [String] {
        return ["en"]
    }

    /// Name for storaged Json Files
    /// The rule for name is fileName-LanguageKey.json
    open var fileName = "lang"

    /// Bundle used to load files from.
    /// Defaults to the main bundle.
    private var usedBundle = Bundle.main

    /// Default language, if this can't find a key in your current language
    /// Try read key in default language
    open var defaultLanguage: String = "en"

    /// Storaged language or default language in device
    open var currentLanguage: String {
        let defaults = UserDefaults.standard
        if let lang = defaults.string(forKey: localizeStorageKey) {
            return lang
        }
        return Locale.preferredLanguages.first ?? defaultLanguage
    }

    /// Path for your env
    /// if testing mode is enable we change the bundle
    /// in other case use a main bundle.
    ///
    /// - returns: a string url where is your file
    internal var bundle: Bundle {
        return usedBundle
    }

    // MARK: Internal methods.

    // MARK: Public methods

    /// Update default language, this stores a language key which can be retrieved the next time
    open func update(language: String) {
        let defaults = UserDefaults.standard
        defaults.setValue(language, forKey: localizeStorageKey)
        defaults.synchronize()
        NotificationCenter.default.post(
            name: Notification.Name(rawValue: localizeChangeNotification),
            object: nil
        )
    }

    /// Update default language
    open func update(defaultLanguage: String) {
        self.defaultLanguage = defaultLanguage
    }

    /// This remove the language key storaged.
    open func resetLanguage() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: localizeStorageKey)
        defaults.synchronize()
    }

    /// Display name for current user language.
    ///
    /// - return: String form language code in current user language
    open func displayNameForLanguage(_ language: String) -> String {
        let locale: NSLocale = NSLocale(localeIdentifier: currentLanguage)

        guard let name = locale.displayName(
            forKey: NSLocale.Key.identifier,
            value: language) else {
            return ""
        }

        return name.capitalized
    }

    /// Update base file name, searched in path.
    open func update(fileName: String) {
        self.fileName = fileName
    }

    /// Update the bundle used to load files from.
    open func update(bundle: Bundle) {
        self.usedBundle = bundle
    }

    // MARK: Localize methods.

    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// That prevent replace untagged values
    ///
    /// - returns: localized key or same text
    open func localize(key: String, tableName: String? = nil) -> String {
        fatalError("implement it")
    }

    /// Localize a string using your JSON File
    /// That replace all % character in your string with replace value.
    ///
    /// - parameter value: The replacement value
    ///
    /// - returns: localized key or same text
    open func localize(key: String, replace: String, tableName: String? = nil) -> String {
        let string = localize(key: key, tableName: tableName)

        return string.replacingOccurrences(of: "%", with: replace)
    }

    /// Localize a string using your JSON File
    /// That replace each % character in your string with each replace value.
    ///
    /// - parameter value: The replacement values
    ///
    /// - returns: localized key or same text
    open func localize(
      key: String,
      values replace: [Any],
      tableName: String? = nil) -> String {
      
      let string = localize(key: key, tableName: tableName)
      let stringFormat = string.replacingOccurrences(of: "%", with: "%@")
      return String(format: stringFormat, arguments: replace.map { "\($0)" })
    }


    /// Localize string with dictionary values
    /// Get properties in your key with rule :property
    /// If property not exist in this string, not is used.
    ///
    /// - parameter value: The replacement dictionary
    ///
    /// - returns: localized key or same text
    open func localize(
        key: String,
        dictionary replace: [String: String],
        tableName: String? = nil) -> String {

        var string = localize(key: key, tableName: tableName)
        for (key, value) in replace {
            string = string.replacingOccurrences(of: ":\(key)", with: value)
        }
        return string
    }

}
