//
//  Localizable.swift
//  JsonLocalizable
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import UIKit

// String extension used to localize your keys matched in your JSON File.

public extension String {
    
    // Localize a string using your JSON File
    // If the key is not found return the same key
    // That prevent replace untagged values
    
    public func localize() -> String {
        let localize = Localizable.shared
        return localize.localize(key: self)
    }
    
    // Localize a string using your JSON File
    // That replace all % character in your string with replace value.
    
    public func localize(value:String) -> String {
        let localize = Localizable.shared
        return localize.localize(key: self, replace: value)
    }
    
    // Localize a string using your JSON File
    // That replace each % character in your string with each replace value.
    
    public func localize(values:Any...) -> String {
        let localize = Localizable.shared
        return localize.localize(key: self, values: values)
    }
    
    // Localize string with dictionary values
    // Get properties in your key with rule :property
    // If property not exist in this string, not is used.
    
    public func localize(dictionary values:[String:String]) -> String {
        let localize = Localizable.shared
        return localize.localize(key: self, dictionary: values)
    }
    
}
