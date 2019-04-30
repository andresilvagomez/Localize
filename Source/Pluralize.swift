//
//  Pluralize.swift
//  Localize
//
//  Copyright © 2019 @andresilvagomez.
//

import Foundation

fileprivate extension Int {
    /// Get plural string value for Int value.
    var plural: String {
        switch self {
        case 0:
            return "zero"
        case 1:
            return "one"
        case 2:
            return "two"
        case 3...99:
            return "many"
        case 100...999:
            return "hundreds"
        case 1_000...999_999:
            return "thousand"
        case 1_000_000...999_999_999:
            return "millions"
        default:
            return "other"
        }
    }
}

/// Pluralize is a class focused in reduce your app logic for localized values
/// you can pluralize
public class Pluralize {

    /// Pluralize strings with numeric value
    /// get localized and pluralized key acording with the rules
    /// and value.
    ///
    /// - parameter String: The value could you pluralize
    ///
    /// - returns: Localized and Pluralized key according with the value.
    static func pluralize(key: String, value: Int, tableName: String? = nil) -> String {
        let key = "\(key).\(value.plural)"

        return key.localize(value: "\(value)", tableName: tableName)
    }
}
