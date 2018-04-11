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
    static func localize(key: inout String?, value: inout String?, updateKey: Bool = true) -> String {
        if let localized = key?.localize() {
            value = localized
            return localized
        }
        if let localized = value?.localize() {
            if updateKey { key = value }
            value = localized
            return localized
        }
        return value ?? ""
    }
    
    static func keyFor(index: Int, localizeKey: String?) -> String? {
        let keys = localizeKey?.components(separatedBy: ", ")
        return keys?.count ?? 0 > index ? keys?[index] : nil
    }
}
