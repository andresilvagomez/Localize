//
//  Localizable.swift
//  JsonLocalizable
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import UIKit

public extension String {
    
    public func localize() -> String {
        let localize = Localizable.shared
        return localize.localize(key: self)
    }
    
    public func localize(value:String) -> String {
        let localize = Localizable.shared
        return localize.localize(key: self, replace: value)
    }
    
    public func localize(values:Any...) -> String {
        let localize = Localizable.shared
        return localize.localize(key: self, values: values)
    }
    
    public func localize(dictionary values:[String:String]) -> String {
        let localize = Localizable.shared
        return localize.localize(key: self, dictionary: values)
    }
    
}
