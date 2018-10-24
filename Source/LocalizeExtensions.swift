//
//  LocalizeExtensions.swift
//  Localize
//
//  Copyright © 2017 @andresilvagomez.
//

import UIKit

private var localizeKey1: UInt8 = 0
private var localizeKey2: UInt8 = 1
private var autoLocalizeKey: UInt8 = 2

/// Extension for NSCoding, easy way to storage IBInspectable properties.
extension NSCoding {
    /// Get associated property by IBInspectable var.
    fileprivate func localizedValueFor(key: UnsafeMutablePointer<UInt8>) -> String? {
        return objc_getAssociatedObject(self, key) as? String
    }

    /// Set associated property by IBInspectable var.
    fileprivate func setLocalized(value: String?, key: UnsafeMutablePointer<UInt8>) {
        guard let value = value else { return }
        let policy = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
        objc_setAssociatedObject(self, key, value, policy)
    }

    /// Get associated autoLocalize property by IBInspectable var.
    fileprivate func autoLocalizeValue() -> Bool {
        return objc_getAssociatedObject(self, &autoLocalizeKey) as? Bool ?? true
    }

    /// Set associated autoLocalize property by IBInspectable var.
    fileprivate func setAutoLocalizeValue(value: Bool) {
        let policy = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
        objc_setAssociatedObject(self, &autoLocalizeKey, value, policy)
    }
}

/// Extension for NotificationCenter to call easy the localize notification observer.
extension NotificationCenter {
    /// Custom function to add observers.
    fileprivate static func localize(observer: Any, selector: Selector) {
        NotificationCenter.default.addObserver(
            observer,
            selector: selector,
            name: NSNotification.Name(localizeChangeNotification),
            object: nil
        )
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UIBarButtonItem {
    /// Auto localize stored property
    @IBInspectable public var autoLocalize: Bool {
        get { return autoLocalizeValue() }
        set { setAutoLocalizeValue(value: newValue) }
    }

    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
        get { return localizedValueFor(key: &localizeKey1) }
        set { setLocalized(value: newValue, key: &localizeKey1) }
    }

    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UIBarButtonItem
    open override func awakeFromNib() {
        super.awakeFromNib()
        if autoLocalize {
            localize()
            NotificationCenter.localize(observer: self, selector: #selector(localize))
        }
    }

    /// Here we change text with key replacement
    @objc public func localize() {
        title = LocalizeUI.localize(key: &localizeKey, value: &title)
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UIButton {
    /// Auto localize stored property
    @IBInspectable public var autoLocalize: Bool {
        get { return autoLocalizeValue() }
        set { setAutoLocalizeValue(value: newValue) }
    }

    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
        get { return localizedValueFor(key: &localizeKey1) }
        set { setLocalized(value: newValue, key: &localizeKey1) }
    }

    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UIButton in each state
    open override func awakeFromNib() {
        super.awakeFromNib()
        if autoLocalize {
            localize()
            NotificationCenter.localize(observer: self, selector: #selector(localize))
        }
    }

    /// Here we change text with key replacement
    @objc public func localize() {
        var title = titleLabel?.text
        titleLabel?.text = LocalizeUI.localize(key: &localizeKey, value: &title)
        #if swift(>=4.2)
        let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        #else
        let states: [UIControlState] = [.normal, .highlighted, .selected, .disabled]
        #endif
        for state in states {
            var title = self.title(for: state)
            title = LocalizeUI.localize(key: &localizeKey, value: &title)
            setTitle(title, for: state)
        }
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UILabel {
    /// Auto localize stored property
    @IBInspectable public var autoLocalize: Bool {
        get { return autoLocalizeValue() }
        set { setAutoLocalizeValue(value: newValue) }
    }

    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
        get { return localizedValueFor(key: &localizeKey1) }
        set { setLocalized(value: newValue, key: &localizeKey1) }
    }

    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UILabel
    open override func awakeFromNib() {
        super.awakeFromNib()
        if autoLocalize {
            localize()
            NotificationCenter.localize(observer: self, selector: #selector(localize))
        }
    }

    /// Here we change text with key replacement
    @objc public func localize() {
        LocalizeUI.localize(key: &localizeKey, value: &text)
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UINavigationItem {
    /// Auto localize stored property
    @IBInspectable public var autoLocalize: Bool {
        get { return autoLocalizeValue() }
        set { setAutoLocalizeValue(value: newValue) }
    }

    /// Localizable tag storeged property
    @IBInspectable public var localizeTitle: String? {
        get { return localizedValueFor(key: &localizeKey1) }
        set { setLocalized(value: newValue, key: &localizeKey1) }
    }

    /// Localizable tag storeged property
    @IBInspectable public var localizePrompt: String? {
        get { return localizedValueFor(key: &localizeKey2) }
        set { setLocalized(value: newValue, key: &localizeKey2) }
    }

    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title and prompt for UINavigationItem
    open override func awakeFromNib() {
        super.awakeFromNib()
        if autoLocalize {
            localize()
            NotificationCenter.localize(observer: self, selector: #selector(localize))
        }
    }

    /// Here we change text with key replacement
    @objc public func localize() {
        LocalizeUI.localize(key: &localizeTitle, value: &title)
        LocalizeUI.localize(key: &localizePrompt, value: &prompt)
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UISearchBar {
    /// Auto localize stored property
    @IBInspectable public var autoLocalize: Bool {
        get { return autoLocalizeValue() }
        set { setAutoLocalizeValue(value: newValue) }
    }

    /// Localizable tag storeged property
    @IBInspectable public var localizePlaceholder: String? {
        get { return localizedValueFor(key: &localizeKey1) }
        set { setLocalized(value: newValue, key: &localizeKey1) }
    }

    /// Localizable tag storeged property
    @IBInspectable public var localizePrompt: String? {
        get { return localizedValueFor(key: &localizeKey2) }
        set { setLocalized(value: newValue, key: &localizeKey2) }
    }

    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title and prompt for UISearchBar
    open override  func awakeFromNib() {
        super.awakeFromNib()
        if autoLocalize {
            localize()
            NotificationCenter.localize(observer: self, selector: #selector(localize))
        }
    }

    /// Here we change text with key replacement
    @objc public func localize() {
        LocalizeUI.localize(key: &localizePlaceholder, value: &placeholder)
        LocalizeUI.localize(key: &localizePrompt, value: &prompt)
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UISegmentedControl {
    /// Auto localize stored property
    @IBInspectable public var autoLocalize: Bool {
        get { return autoLocalizeValue() }
        set { setAutoLocalizeValue(value: newValue) }
    }

    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
        get { return localizedValueFor(key: &localizeKey1) }
        set { setLocalized(value: newValue, key: &localizeKey1) }
    }

    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UISegmentedControl in each state
    open override func awakeFromNib() {
        super.awakeFromNib()
        if autoLocalize {
            localize()
            NotificationCenter.localize(observer: self, selector: #selector(localize))
        }
    }

    /// Here we change text with key replacement
    @objc public func localize() {
        for index in 0...(numberOfSegments - 1) {
            var key = LocalizeUI.keyFor(index: index, localizeKey: localizeKey)
            var title = titleForSegment(at: index)
            title = LocalizeUI.localize(key: &key, value: &title, updateKey: false)
            setTitle(title, forSegmentAt: index)
        }
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UITabBarItem {
    /// Auto localize stored property
    @IBInspectable public var autoLocalize: Bool {
        get { return autoLocalizeValue() }
        set { setAutoLocalizeValue(value: newValue) }
    }

    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
        get { return localizedValueFor(key: &localizeKey1) }
        set { setLocalized(value: newValue, key: &localizeKey1) }
    }

    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UITabBarItem
    open override func awakeFromNib() {
        super.awakeFromNib()
        if autoLocalize {
            localize()
            NotificationCenter.localize(observer: self, selector: #selector(localize))
        }
    }

    /// Here we change text with key replacement
    @objc public func localize() {
        LocalizeUI.localize(key: &localizeKey, value: &title)
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UITextField {
    /// Auto localize stored property
    @IBInspectable public var autoLocalize: Bool {
        get { return autoLocalizeValue() }
        set { setAutoLocalizeValue(value: newValue) }
    }

    /// Localizable tag storeged property
    @IBInspectable public var localizeText: String? {
        get { return localizedValueFor(key: &localizeKey1) }
        set { setLocalized(value: newValue, key: &localizeKey1) }
    }

    /// Localizable tag storeged property
    @IBInspectable public var localizePlaceholder: String? {
        get { return localizedValueFor(key: &localizeKey2) }
        set { setLocalized(value: newValue, key: &localizeKey2) }
    }

    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title and placeholder for UITextField
    open override func awakeFromNib() {
        super.awakeFromNib()
        if autoLocalize {
            localize()
            NotificationCenter.localize(observer: self, selector: #selector(localize))
        }
    }

    /// Here we change text with key replacement
    @objc public func localize() {
        LocalizeUI.localize(key: &localizeText, value: &text)
        LocalizeUI.localize(key: &localizePlaceholder, value: &placeholder)
    }
}

/// Extension for UI element is the easier way to localize your keys.
extension UITextView {
    /// Auto localize stored property
    @IBInspectable public var autoLocalize: Bool {
        get { return autoLocalizeValue() }
        set { setAutoLocalizeValue(value: newValue) }
    }

    /// Localizable tag storeged property
    @IBInspectable public var localizeKey: String? {
        get { return localizedValueFor(key: &localizeKey1) }
        set { setLocalized(value: newValue, key: &localizeKey1) }
    }

    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UITextView
    open override func awakeFromNib() {
        super.awakeFromNib()
        if autoLocalize {
            localize()
            NotificationCenter.localize(observer: self, selector: #selector(localize))
        }
    }

    /// Here we change text with key replacement
    @objc public func localize() {
        var localize = text
        localize = LocalizeUI.localize(key: &localizeKey, value: &localize)
        text = localize
    }
}
