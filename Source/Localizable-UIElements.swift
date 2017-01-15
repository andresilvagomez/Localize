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
            self.title = self.localizableKey!.localize()
        }
    }
    
}

public class LocalizableButton: UIButton {
    
    /// Inspectable element to replace title in UIButton.
    @IBInspectable public var localizableKey: String? {
        didSet {
            for state in [UIControlState.normal, .highlighted, .selected, .disabled] {
                self.setTitle(self.localizableKey!.localize(), for: state)
            }
        }
    }
    
}

public class LocalizableLabel: UILabel {
    
    /// Inspectable element to replace text in UILabel.
    @IBInspectable public var localizableKey : String? {
        didSet {
            self.text = self.localizableKey!.localize()
        }
    }
    
}

public class LocalizableNavigationBarItem: UINavigationItem {
    
    /// Inspectable element to replace title in UINavigationItem.
    @IBInspectable public var localizableKeyTitle: String? {
        didSet {
            self.title = self.localizableKeyTitle!.localize()
        }
    }
    
    /// Inspectable element to replace prompt in UINavigationItem.
    @IBInspectable public var localizableKeyPrompt: String? {
        didSet {
            self.prompt = self.localizableKeyPrompt!.localize()
        }
    }
    
}

public class LocalizableSearchBar: UISearchBar {
    
    /// Inspectable element to replace placeholder in UISearchBar.
    @IBInspectable public var localizableKeyPlaceholder: String? {
        didSet {
            self.placeholder = self.localizableKeyPlaceholder!.localize()
        }
    }
    
    /// Inspectable element to replace prompt in UISearchBar.
    @IBInspectable public var localizableKeyPrompt: String? {
        didSet {
            self.prompt = self.localizableKeyPrompt!.localize()
        }
    }
    
}

public class LocalizableSegmentedControler: UISegmentedControl {
    
    /// Inspectable element to replace titles in UISegmentedControl.
    /// Please separete keys with ,
    @IBInspectable public var localizableKey : String? {
        didSet {
            for index in 0...(self.numberOfSegments-1) {
                let key = self.localizableKey?.components(separatedBy: ",")
                self.setTitle(key![index].localize(), forSegmentAt: index)
            }
        }
    }
    
}

public class LocalizableBarItem: UITabBarItem {
    
    /// Inspectable element to replace title in UITabBarItem.
    @IBInspectable public var localizableKey : String? {
        didSet {
            self.title = self.localizableKey!.localize()
        }
    }
}

public class LocalizableTextField: UITextField {
    
    /// Inspectable element to replace text in UITextField.
    @IBInspectable public var localizableKeyText: String? {
        didSet {
            self.text = self.localizableKeyText!.localize()
        }
    }
    
    /// Inspectable element to replace placeholder in UITextField.
    @IBInspectable public var localizableKeyPlaceholder: String? {
        didSet {
            self.placeholder = self.localizableKeyPlaceholder!.localize()
        }
    }
    
    
}

public class LocalizableTextView: UITextView {
    
    /// Inspectable element to replace text in UITextView.
    @IBInspectable public var localizableKey : String? {
        didSet {
            self.text = self.localizableKey!.localize()
        }
    }
    
}
