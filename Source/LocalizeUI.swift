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
        var localizeKey = localizeKey?.replacingOccurrences(of: " ", with: "")
        let root = localizeKey?.components(separatedBy: ":")
        var rootKey: String? = nil
        
        if root?.count == 2 {
            rootKey = root?.first
            localizeKey = root?.last
        }
        
        let keys = localizeKey?.components(separatedBy: ",")
        let key = keys?.count ?? 0 > index ? keys?[index] : nil
        
        if key == nil || key?.isEmpty ?? true { return nil }
        if rootKey == nil { return key }
        
        return "\(rootKey ?? "").\(key ?? "")"
    }
}
