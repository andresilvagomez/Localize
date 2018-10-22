//
//  CustomLocalizeProtocol.swift
//  Example
//
//  Created by Andres Silva on 10/22/18.
//  Copyright © 2018 Kekiiwaa . All rights reserved.
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
