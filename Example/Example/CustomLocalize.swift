//
//  CustomLocalizeProtocol.swift
//  Example
//
//  Copyright © 2019 @andresilvagomez.
//

import Foundation
import Localize

class CustomLocalize: LocalizeCommonProtocol {
    /// Custom init
    override init() {
        super.init()
    }

    /// Localize a string using your JSON File
    /// If the key is not found return the same key
    /// That prevent replace untagged values
    ///
    /// - returns: localized key or same text
    public override func localize(key: String, tableName: String? = nil) -> String {
        return key + " helloooooooooo"
    }
}
