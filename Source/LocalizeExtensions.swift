//
//  LocalizableExtensions.swift
//  Localize
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import UIKit

private var localizeKey1: UInt8 = 0
private var localizeKey2: UInt8 = 1

/// Extension for UI element is the easier way to localize your keys.
extension UIBarButtonItem {
    
    /// Localizable tag storeged property
    var localizeTag: String! {
        get {
            return objc_getAssociatedObject(self, &localizeKey1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UIBarButtonItem
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    public func localize() {
        if Localize.shared.localizableInterface == .classes {
            return
        }
        if self.localizeTag != nil {
            self.title = self.localizeTag?.localize()
            return
        }
        if let title = self.title, !title.isEmpty {
            self.title = title.localize()
            if self.localizeTag == nil && self.title != title {
                self.localizeTag = title
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UIButton {
    
    /// Localizable tag storeged property
    var localizeTag: String! {
        get {
            return objc_getAssociatedObject(self, &localizeKey1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UIButton in each state
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    public func localize() {
        if Localize.shared.localizableInterface == .classes {
            return
        }
        if self.localizeTag != nil {
            for state in [UIControlState.normal, .highlighted, .selected, .disabled] {
                if let title = title(for: state) , !title.isEmpty {
                    self.setTitle(self.localizeTag?.localize(), for: state)
                }
            }
            return
        }
        for state in [UIControlState.normal, .highlighted, .selected, .disabled] {
            if let title = title(for: state), !title.isEmpty {
                let localized = title.localize()
                self.setTitle(localized, for: state)
                if self.localizeTag == nil && localized != title {
                    self.localizeTag = title
                }
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UILabel {
    
    /// Localizable tag storeged property
    var localizeTag: String! {
        get {
            return objc_getAssociatedObject(self, &localizeKey1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UILabel
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    public func localize() {
        if Localize.shared.localizableInterface == .classes {
            return
        }
        if self.localizeTag != nil {
            self.text = self.localizeTag?.localize()
            return
        }
        if let text = text, !text.isEmpty {
            self.text = text.localize()
            if self.localizeTag == nil && self.text != text {
                self.localizeTag = text
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UINavigationItem {
    
    /// Localizable tag storeged property
    var localizeTagTitle: String! {
        get {
            return objc_getAssociatedObject(self, &localizeKey1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Localizable tag storeged property
    var localizeTagPrompt: String! {
        get {
            return objc_getAssociatedObject(self, &localizeKey2) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey2, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title and prompt for UINavigationItem
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    public func localize() {
        if Localize.shared.localizableInterface == .classes {
            return
        }
        self.localizeTitle()
        self.localizePrompt()
    }
    
    /// Here we change text with key replacement for title
    func localizeTitle() {
        if self.localizeTagTitle != nil {
            self.title = self.localizeTagTitle?.localize()
            return
        }
        if let title = self.title, !title.isEmpty {
            self.title = title.localize()
            if self.localizeTagTitle == nil && self.title != title {
                self.localizeTagTitle = title
            }
        }
    }
    
    /// Here we change text with key replacement for prompt
    func localizePrompt() {
        if self.localizeTagPrompt != nil {
            self.prompt = self.localizeTagPrompt?.localize()
            return
        }
        if let prompt = self.prompt, !prompt.isEmpty {
            self.prompt = prompt.localize()
            if self.localizeTagPrompt == nil && self.prompt != prompt {
                self.localizeTagPrompt = prompt
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UISearchBar {
    
    /// Localizable tag storeged property
    var localizeTagPlaceholder: String! {
        get {
            return objc_getAssociatedObject(self, &localizeKey1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Localizable tag storeged property
    var localizeTagPrompt: String! {
        get {
            return objc_getAssociatedObject(self, &localizeKey2) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey2, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title and prompt for UISearchBar
    open override  func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    public func localize() {
        if Localize.shared.localizableInterface == .classes {
            return
        }
        self.localizePlaceholder()
        self.localizePrompt()
    }
    
    /// Here we change text with key replacement for placeholder
    func localizePlaceholder() {
        if self.localizeTagPlaceholder != nil {
            self.placeholder = self.localizeTagPlaceholder?.localize()
            return
        }
        if let placeholder = self.placeholder, !placeholder.isEmpty {
            self.placeholder = placeholder.localize()
            if self.localizeTagPlaceholder == nil && self.placeholder != placeholder {
                self.localizeTagPlaceholder = placeholder
            }
        }
    }
    
    /// Here we change text with key replacement for prompt
    func localizePrompt() {
        if self.localizeTagPrompt != nil {
            self.prompt = self.localizeTagPrompt?.localize()
            return
        }
        if let prompt = self.prompt, !prompt.isEmpty {
            self.prompt = prompt.localize()
            if self.localizeTagPrompt == nil && self.prompt != prompt {
                self.localizeTagPrompt = prompt
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UISegmentedControl {
    
    /// Localizable tag storeged property
    var localizeTag: String! {
        get {
            return objc_getAssociatedObject(self, &localizeKey1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UISegmentedControl in each state
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    public func localize() {
        if Localize.shared.localizableInterface == .classes {
            return
        }
        for index in 0...(self.numberOfSegments-1) {
            if let title = self.titleForSegment(at: index), !title.isEmpty {
                self.setTitle(title.localize(), forSegmentAt: index)
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UITabBarItem {
    
    /// Localizable tag storeged property
    var localizeTag: String! {
        get {
            return objc_getAssociatedObject(self, &localizeKey1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UITabBarItem
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    public func localize() {
        if Localize.shared.localizableInterface == .classes {
            return
        }
        if self.localizeTag != nil {
            self.title = self.localizeTag?.localize()
            return
        }
        if let title = self.title, !title.isEmpty {
            self.title = title.localize()
            if self.localizeTag == nil && self.title != title {
                self.localizeTag = title
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UITextField {
    
    /// Localizable tag storeged property
    var localizeTagText: String! {
        get {
            return objc_getAssociatedObject(self, &localizeKey1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Localizable tag storeged property
    var localizeTagPlaceholder: String! {
        get {
            return objc_getAssociatedObject(self, &localizeKey2) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey2, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title and placeholder for UITextField
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    public func localize() {
        if Localize.shared.localizableInterface == .classes {
            return
        }
        self.localizePlaceholder()
        self.localizeText()
    }
    
    /// Here we change text with key replacement for placeholder
    func localizePlaceholder() {
        if self.localizeTagPlaceholder != nil {
            self.placeholder = self.localizeTagPlaceholder?.localize()
            return
        }
        if let placeholder = self.placeholder, !placeholder.isEmpty {
            self.placeholder = placeholder.localize()
            if self.localizeTagPlaceholder == nil && self.placeholder != placeholder {
                self.localizeTagPlaceholder = placeholder
            }
        }
    }
    
    /// Here we change text with key replacement for text
    func localizeText() {
        if self.localizeTagText != nil {
            self.text = self.localizeTagText?.localize()
            return
        }
        if let text = self.text, !text.isEmpty {
            self.text = text.localize()
            if self.localizeTagText == nil && self.text != text {
                self.localizeTagText = text
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UITextView {
    
    /// Localizable tag storeged property
    var localizeTag: String! {
        get {
            return objc_getAssociatedObject(self, &localizeKey1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UITextView
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    public func localize() {
        if Localize.shared.localizableInterface == .classes {
            return
        }
        if self.localizeTag != nil {
            self.text = self.localizeTag?.localize()
            return
        }
        if let text = self.text, !text.isEmpty {
            self.text = text.localize()
            if self.localizeTag == nil && self.text != text {
                self.localizeTag = text
            }
        }
    }
    
}
