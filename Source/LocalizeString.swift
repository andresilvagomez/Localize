//
//  LocalizeString.swift
//  Localize
//
//  Copyright © 2017 @andresilvagomez.
//

import Foundation

/// String extension used to localize your keys matched
/// in your JSON File.
public extension String {

    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// that prevent replace untagged values
    ///
    /// - returns: localized key or same text
    var localized: String {
        return Localize.localize(key: self)
    }

    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// that prevent replace untagged values
    ///
    /// - returns: localized key or same text
    func localize() -> String {
        return Localize.localize(key: self)
    }

    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// that prevent replace untagged values
    ///
    /// - returns: localized key or same text
    func localize(tableName: String) -> String {
        return Localize.localize(key: self, tableName: tableName)
    }

    /// Localize a string using your JSON File
    /// that replace all % character in your string with replace value.
    ///
    /// - parameter String: The replacement value
    ///
    /// - returns: localized key or same text
    func localize(value: String, tableName: String? = nil) -> String {
        return Localize.localize(key: self, replace: value, tableName: tableName)
    }

    /// Localize a string using your JSON File
    /// that replace each % character in your string with each replace value.
    ///
    /// - parameter Strings: The replacement values
    ///
    /// - returns: localized key or same text
    func localize(values: String..., tableName: String? = nil) -> String {
        return Localize.localize(key: self, values: values, tableName: tableName)
    }

    /// Localize string with dictionary values
    /// get properties in your key with rule :property
    /// if property not exist in this string, not is used.
    ///
    /// - parameter [String:String]: The replacement dictionary
    ///
    /// - returns: localized key or same text
    func localize(
        dictionary values: [String: String],
        tableName: String? = nil) -> String {

        return Localize.localize(key: self, dictionary: values, tableName: tableName)
    }

}
