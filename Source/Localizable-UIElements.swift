//
//  Localizable-UIElements.swift
//  JsonLocalizable
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import UIKit

public class LocalizableBarButtonItem: UIBarButtonItem {
    
    @IBInspectable public var localizableKey : String? {
        didSet {
            self.title = self.localizableKey!.localize()
        }
    }
    
}

public class LocalizableButton: UIButton {
    
    @IBInspectable public var localizableKey: String? {
        didSet {
            for state in [UIControlState.normal, .highlighted, .selected, .disabled] {
                self.setTitle(self.localizableKey!.localize(), for: state)
            }
        }
    }
    
}

public class LocalizableLabel: UILabel {
    
    @IBInspectable public var localizableKey : String? {
        didSet {
            self.text = self.localizableKey!.localize()
        }
    }
    
}

public class LocalizableNavigationBarItem: UINavigationItem {
    
    @IBInspectable public var localizableKeyTitle: String? {
        didSet {
            self.title = self.localizableKeyTitle!.localize()
        }
    }
    
    @IBInspectable public var localizableKeyPrompt: String? {
        didSet {
            self.prompt = self.localizableKeyPrompt!.localize()
        }
    }
    
}

public class LocalizableSearchBar: UISearchBar {
    
    @IBInspectable public var localizableKeyPlaceholder: String? {
        didSet {
            self.placeholder = self.localizableKeyPlaceholder!.localize()
        }
    }
    
    @IBInspectable public var localizableKeyPrompt: String? {
        didSet {
            self.prompt = self.localizableKeyPrompt!.localize()
        }
    }
    
}

public class LocalizableSegmentedControler: UISegmentedControl {
    
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
    
    @IBInspectable public var localizableKey : String? {
        didSet {
            self.title = self.localizableKey!.localize()
        }
    }
}

public class LocalizableTextField: UITextField {
    
    @IBInspectable public var localizableKeyText: String? {
        didSet {
            self.text = self.localizableKeyText!.localize()
        }
    }
    
    @IBInspectable public var localizableKeyPlaceholder: String? {
        didSet {
            self.placeholder = self.localizableKeyPlaceholder!.localize()
        }
    }
    
    
}

public class LocalizableTextView: UITextView {
    
    @IBInspectable public var localizableKey : String? {
        didSet {
            self.text = self.localizableKey!.localize()
        }
    }
    
}
