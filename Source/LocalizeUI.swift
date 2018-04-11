//
//  LocalizeUI.swift
//  Localize
//
//  Created by Andres Silva Gomez on 4/10/18.
//  Copyright © 2018 Kekiiwaa. All rights reserved.
//

import UIKit

class LocalizeUI: NSObject {
    @discardableResult
    static func localize(key: inout String?, value: inout String?) -> String {
        if let localized = key?.localize() {
            value = localized
            return localized
        }
        if let localized = value?.localize() {
            key = value
            value = localized
            return localized
        }
        return value ?? ""
    }
}
