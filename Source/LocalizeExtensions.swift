//
//  LocalizableExtensions.swift
//  Localize
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import UIKit

private var localizeKey1: UInt8 = 0
private var localizeKey2: UInt8 = 1

extension NSCoding {
    fileprivate func localizedValue(forObject object: Any, key: UnsafeMutablePointer<UInt8>) -> String? {
        return objc_getAssociatedObject(object, key) as? String
    }
    
    fileprivate func setLocalizedValue(_ value: String?, forObject object: Any, key: UnsafeMutablePointer<UInt8>) {
        guard let value = value else {
            return
        }
        
        objc_setAssociatedObject(self, key, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

extension NotificationCenter {
    fileprivate static func localize(observer: Any, selector: Selector) {
        NotificationCenter.default.addObserver(
            observer,
            selector: selector,
            name: NSNotification.Name(LocalizeChangeNotification),
            object: nil
        )
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UIBarButtonItem {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
        get { return localizedValue(forObject: self, key: &localizeKey1) }
        set { setLocalizedValue(newValue, forObject: self, key: &localizeKey1) }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UIBarButtonItem
    open override func awakeFromNib() {
        super.awakeFromNib()
        localize()
        NotificationCenter.localize(observer: self, selector: #selector(localize))
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        title = localizeKey?.localize() ?? title?.localize() ?? title
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UIButton {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
        get { return localizedValue(forObject: self, key: &localizeKey1) }
        set { setLocalizedValue(newValue, forObject: self, key: &localizeKey1) }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UIButton in each state
    open override func awakeFromNib() {
        super.awakeFromNib()
        localize()
        NotificationCenter.localize(observer: self, selector: #selector(localize))
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        for state in [UIControlState.normal, .highlighted, .selected, .disabled] {
            var title = self.title(for: state)
            title = localizeKey?.localize() ?? title?.localize() ?? title
            setTitle(title, for: state)
        }
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UILabel {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
        get { return localizedValue(forObject: self, key: &localizeKey1) }
        set { setLocalizedValue(newValue, forObject: self, key: &localizeKey1) }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UILabel
    open override func awakeFromNib() {
        super.awakeFromNib()
        localize()
        NotificationCenter.localize(observer: self, selector: #selector(localize))
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        text = localizeKey?.localize() ?? text?.localize() ?? text
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UINavigationItem {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeTitle: String? {
        get { return localizedValue(forObject: self, key: &localizeKey1) }
        set { setLocalizedValue(newValue, forObject: self, key: &localizeKey1) }
    }
    
    /// Localizable tag storeged property
    @IBInspectable public var localizePrompt: String? {
        get { return localizedValue(forObject: self, key: &localizeKey2) }
        set { setLocalizedValue(newValue, forObject: self, key: &localizeKey2) }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title and prompt for UINavigationItem
    open override func awakeFromNib() {
        super.awakeFromNib()
        localize()
        NotificationCenter.localize(observer: self, selector: #selector(localize))
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        title = localizeTitle?.localize() ?? title?.localize() ?? title
        prompt = localizePrompt?.localize() ?? prompt?.localize() ?? prompt
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UISearchBar {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizePlaceholder: String? {
        get { return localizedValue(forObject: self, key: &localizeKey1) }
        set { setLocalizedValue(newValue, forObject: self, key: &localizeKey1) }
    }
    
    /// Localizable tag storeged property
    @IBInspectable public var localizePrompt: String? {
        get { return localizedValue(forObject: self, key: &localizeKey2) }
        set { setLocalizedValue(newValue, forObject: self, key: &localizeKey2) }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title and prompt for UISearchBar
    open override  func awakeFromNib() {
        super.awakeFromNib()
        localize()
        NotificationCenter.localize(observer: self, selector: #selector(localize))
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        placeholder = localizePlaceholder?.localize() ?? placeholder?.localize() ?? placeholder
        prompt = localizePrompt?.localize() ?? prompt?.localize() ?? prompt
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UISegmentedControl {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
        get { return localizedValue(forObject: self, key: &localizeKey1) }
        set { setLocalizedValue(newValue, forObject: self, key: &localizeKey1) }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UISegmentedControl in each state
    open override func awakeFromNib() {
        super.awakeFromNib()
        localize()
        NotificationCenter.localize(observer: self, selector: #selector(localize))
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        for index in 0...(numberOfSegments - 1) {
            var title = titleForSegment(at: index)
            title = localizeKey?.localize() ?? title?.localize() ?? title
        }
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UITabBarItem {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
        get { return localizedValue(forObject: self, key: &localizeKey1) }
        set { setLocalizedValue(newValue, forObject: self, key: &localizeKey1) }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UITabBarItem
    open override func awakeFromNib() {
        super.awakeFromNib()
        localize()
        NotificationCenter.localize(observer: self, selector: #selector(localize))
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        title = localizeKey?.localize() ?? title?.localize() ?? title
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UITextField {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeText: String? {
        get { return localizedValue(forObject: self, key: &localizeKey1) }
        set { setLocalizedValue(newValue, forObject: self, key: &localizeKey1) }
    }
    
    /// Localizable tag storeged property
    @IBInspectable public var localizePlaceholder: String? {
        get { return localizedValue(forObject: self, key: &localizeKey2) }
        set { setLocalizedValue(newValue, forObject: self, key: &localizeKey2) }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title and placeholder for UITextField
    open override func awakeFromNib() {
        super.awakeFromNib()
        localize()
        NotificationCenter.localize(observer: self, selector: #selector(localize))
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        placeholder = localizePlaceholder?.localize() ?? placeholder?.localize() ?? placeholder
        text = localizeText?.localize() ?? text?.localize() ?? text
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UITextView {
    
    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
        get { return localizedValue(forObject: self, key: &localizeKey1) }
        set { setLocalizedValue(newValue, forObject: self, key: &localizeKey1) }
    }
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UITextView
    open override func awakeFromNib() {
        super.awakeFromNib()
        localize()
        NotificationCenter.localize(observer: self, selector: #selector(localize))
    }
    
    /// Here we change text with key replacement
    @objc public func localize() {
        text = localizeKey?.localize() ?? text?.localize() ?? text
    }
}
