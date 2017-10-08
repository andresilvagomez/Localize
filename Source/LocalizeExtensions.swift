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
    @IBInspectable public var localizeKey: String! {
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
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LocalizeChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        if self.localizeKey != nil {
            self.title = self.localizeKey?.localize()
            return
        }
        if let title = self.title, !title.isEmpty {
            self.title = title.localize()
            if self.localizeKey == nil && self.title != title {
                self.localizeKey = title
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UIButton {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String! {
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
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LocalizeChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        if self.localizeKey != nil {
            for state in [UIControlState.normal, .highlighted, .selected, .disabled] {
                if let title = title(for: state) , !title.isEmpty {
                    self.setTitle(self.localizeKey?.localize(), for: state)
                }
            }
            return
        }
        for state in [UIControlState.normal, .highlighted, .selected, .disabled] {
            if let title = title(for: state), !title.isEmpty {
                let localized = title.localize()
                self.setTitle(localized, for: state)
                if self.localizeKey == nil && localized != title {
                    self.localizeKey = title
                }
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UILabel {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
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
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LocalizeChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        if self.localizeKey != nil {
            self.text = self.localizeKey?.localize()
            return
        }
        if let text = text, !text.isEmpty {
            self.text = text.localize()
            if self.localizeKey == nil && self.text != text {
                self.localizeKey = text
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UINavigationItem {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeTitle: String? {
        get {
            return objc_getAssociatedObject(self, &localizeKey1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Localizable tag storeged property
    @IBInspectable public var localizePrompt: String? {
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
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LocalizeChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        self.localizeTitleFN()
        self.localizePromptFN()
    }
    
    /// Here we change text with key replacement for title
    func localizeTitleFN() {
        if self.localizeTitle != nil {
            self.title = self.localizeTitle?.localize()
            return
        }
        if let title = self.title, !title.isEmpty {
            self.title = title.localize()
            if self.localizeTitle == nil && self.title != title {
                self.localizeTitle = title
            }
        }
    }
    
    /// Here we change text with key replacement for prompt
    func localizePromptFN() {
        if self.localizePrompt != nil {
            self.prompt = self.localizePrompt?.localize()
            return
        }
        if let prompt = self.prompt, !prompt.isEmpty {
            self.prompt = prompt.localize()
            if self.localizePrompt == nil && self.prompt != prompt {
                self.localizePrompt = prompt
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UISearchBar {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizePlaceholder: String? {
        get {
            return objc_getAssociatedObject(self, &localizeKey1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Localizable tag storeged property
    @IBInspectable public var localizePrompt: String? {
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
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LocalizeChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        self.localizePlaceholderFN()
        self.localizePromptFN()
    }
    
    /// Here we change text with key replacement for placeholder
    func localizePlaceholderFN() {
        if self.localizePlaceholder != nil {
            self.placeholder = self.localizePlaceholder?.localize()
            return
        }
        if let placeholder = self.placeholder, !placeholder.isEmpty {
            self.placeholder = placeholder.localize()
            if self.localizePlaceholder == nil && self.placeholder != placeholder {
                self.localizePlaceholder = placeholder
            }
        }
    }
    
    /// Here we change text with key replacement for prompt
    func localizePromptFN() {
        if self.localizePrompt != nil {
            self.prompt = self.localizePrompt?.localize()
            return
        }
        if let prompt = self.prompt, !prompt.isEmpty {
            self.prompt = prompt.localize()
            if self.localizePrompt == nil && self.prompt != prompt {
                self.localizePrompt = prompt
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UISegmentedControl {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
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
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LocalizeChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        for index in 0...(self.numberOfSegments - 1) {
            if let title = self.titleForSegment(at: index), !title.isEmpty {
                self.setTitle(title.localize(), forSegmentAt: index)
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UITabBarItem {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
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
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LocalizeChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        if self.localizeKey != nil {
            self.title = self.localizeKey?.localize()
            return
        }
        if let title = self.title, !title.isEmpty {
            self.title = title.localize()
            if self.localizeKey == nil && self.title != title {
                self.localizeKey = title
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UITextField {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeText: String? {
        get {
            return objc_getAssociatedObject(self, &localizeKey1) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// Localizable tag storeged property
    @IBInspectable public var localizePlaceholder: String? {
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
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LocalizeChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        self.localizePlaceholderFN()
        self.localizeTextFN()
    }
    
    /// Here we change text with key replacement for placeholder
    func localizePlaceholderFN() {
        if self.localizePlaceholder != nil {
            self.placeholder = self.localizePlaceholder?.localize()
            return
        }
        if let placeholder = self.placeholder, !placeholder.isEmpty {
            self.placeholder = placeholder.localize()
            if self.localizePlaceholder == nil && self.placeholder != placeholder {
                self.localizePlaceholder = placeholder
            }
        }
    }
    
    /// Here we change text with key replacement for text
    func localizeTextFN() {
        if self.localizeText != nil {
            self.text = self.localizeText?.localize()
            return
        }
        if let text = self.text, !text.isEmpty {
            self.text = text.localize()
            if self.localizeText == nil && self.text != text {
                self.localizeText = text
            }
        }
    }
    
}

/// Extension for UI element is the easier way to localize your keys.
extension UITextView {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
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
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LocalizeChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        if self.localizeKey != nil {
            self.text = self.localizeKey?.localize()
            return
        }
        if let text = self.text, !text.isEmpty {
            self.text = text.localize()
            if self.localizeKey == nil && self.text != text {
                self.localizeKey = text
            }
        }
    }
    
}
