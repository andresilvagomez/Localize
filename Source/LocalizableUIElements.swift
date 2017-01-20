//
//  Localizable-UIElements.swift
//  JsonLocalizable
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import UIKit

public class LocalizableBarButtonItem: UIBarButtonItem {
    
    /// Inspectable element to replace title in UIBarButtonItem.
    @IBInspectable public var localizableKey : String? {
        didSet {
            self.localize()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    override public func localize() {
        self.title = self.localizableKey?.localize()
    }
    
}

public class LocalizableButton: UIButton {
    
    /// Inspectable element to replace title in UIButton.
    @IBInspectable public var localizableKey: String? {
        didSet {
            self.localize()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    override public func localize() {
        for state in [UIControlState.normal, .highlighted, .selected, .disabled] {
            self.setTitle(self.localizableKey?.localize(), for: state)
        }
    }
    
}

public class LocalizableLabel: UILabel {
    
    /// Inspectable element to replace text in UILabel.
    @IBInspectable public var localizableKey : String? {
        didSet {
            self.localize()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    override public func localize() {
        self.text = self.localizableKey?.localize()
    }
    
}

public class LocalizableNavigationBarItem: UINavigationItem {
    
    /// Inspectable element to replace title in UINavigationItem.
    @IBInspectable public var localizableKeyTitle: String? {
        didSet {
            self.localize()
        }
    }
    
    /// Inspectable element to replace prompt in UINavigationItem.
    @IBInspectable public var localizableKeyPrompt: String? {
        didSet {
            self.localize()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    override public func localize() {
        self.title = self.localizableKeyTitle?.localize()
        self.prompt = self.localizableKeyPrompt?.localize()
    }
    
}

public class LocalizableSearchBar: UISearchBar {
    
    /// Inspectable element to replace placeholder in UISearchBar.
    @IBInspectable public var localizableKeyPlaceholder: String? {
        didSet {
            self.localize()
        }
    }
    
    /// Inspectable element to replace prompt in UISearchBar.
    @IBInspectable public var localizableKeyPrompt: String? {
        didSet {
            self.localize()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    override public func localize() {
        self.placeholder = self.localizableKeyPlaceholder?.localize()
        self.prompt = self.localizableKeyPrompt?.localize()
    }
    
}

public class LocalizableSegmentedControler: UISegmentedControl {
    
    /// Inspectable element to replace titles in UISegmentedControl.
    /// Please separete keys with ,
    @IBInspectable public var localizableKey : String? {
        didSet {
            self.localize()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    override public func localize() {
        for index in 0...(self.numberOfSegments-1) {
            let key = self.localizableKey?.components(separatedBy: ",")
            self.setTitle(key![index].localize(), forSegmentAt: index)
        }
    }
    
}

public class LocalizableBarItem: UITabBarItem {
    
    /// Inspectable element to replace title in UITabBarItem.
    @IBInspectable public var localizableKey : String? {
        didSet {
            self.localize()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    /// Here we change text with key replacement
    override public func localize() {
        self.title = self.localizableKey?.localize()
    }
    
}

public class LocalizableTextField: UITextField {
    
    /// Inspectable element to replace text in UITextField.
    @IBInspectable public var localizableKeyText: String? {
        didSet {
            self.localize()
        }
    }
    
    /// Inspectable element to replace placeholder in UITextField.
    @IBInspectable public var localizableKeyPlaceholder: String? {
        didSet {
            self.localize()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    // Here we change text with key replacement
    override public func localize() {
        self.text = self.localizableKeyText?.localize()
        self.placeholder = self.localizableKeyPlaceholder?.localize()
    }
    
}

public class LocalizableTextView: UITextView {
    
    /// Inspectable element to replace text in UITextView.
    @IBInspectable public var localizableKey : String? {
        didSet {
            self.localize()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        NotificationCenter.default.addObserver(self, selector: #selector(localize), name: NSNotification.Name(LanguageChangeNotification), object: nil)
    }
    
    // Here we change text with key replacement
    override public func localize() {
        self.text = self.localizableKey?.localize()
    }
    
}