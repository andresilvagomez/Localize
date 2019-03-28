//
//
//  LocalizeSwift.swift
//  Localize
//
//  Copyright © 2017 @andresilvagomez.
//

import Foundation

class LocalizeConfig: NSObject {
    var provider: LocalizeType
    var fileName: String
    var defaultLanguage: String
    var currentLanguage: String?

    init(
        provider: LocalizeType = .strings,
        fileName: String = "strings",
        defaultLanguage: String = "en",
        currentLanguage: String? = nil,
        bundle: Bundle = .main) {

        self.provider = provider
        self.fileName = fileName
        self.defaultLanguage = defaultLanguage
        self.currentLanguage = currentLanguage
    }
}
