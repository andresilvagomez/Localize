//
//  UILabel.swift
//  JsonLocalizable
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UIBarButtonItem
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let title = self.title, !title.isEmpty {
            self.title = title.localize()
        }
    }
    
}

extension UIButton {
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UIButton in each state
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        for state in [UIControlState.normal, .highlighted, .selected, .disabled] {
            if let title = title(for: state) , !title.isEmpty {
                self.setTitle(title.localize(), for: state)
            }
        }
    }
    
}

extension UILabel {
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UILabel
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let text = text, !text.isEmpty {
            self.text = text.localize()
        }
    }
    
}

extension UINavigationItem {
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title and prompt for UINavigationItem
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let title = self.title, !title.isEmpty {
            self.title = title.localize()
        }
        
        if let prompt = self.prompt, !prompt.isEmpty {
            self.prompt = prompt.localize()
        }
    }
    
}

extension UISearchBar {
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title and prompt for UISearchBar
    open override  func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let placeholder = self.placeholder, !placeholder.isEmpty {
            self.placeholder = placeholder.localize()
        }
        
        if let prompt = self.prompt, !prompt.isEmpty {
            self.prompt = prompt.localize()
        }
    }
    
}

extension UISegmentedControl {
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UISegmentedControl in each state
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        for index in 0...(self.numberOfSegments-1) {
            if let title = self.titleForSegment(at: index), !title.isEmpty {
                self.setTitle(title.localize(), forSegmentAt: index)
            }
        }
    }
    
}

extension UITabBarItem {
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UITabBarItem
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let title = self.title, !title.isEmpty {
            self.title = title.localize()
        }
    }
    
}

extension UITextField {
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title and placeholder for UITextField
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let placeholder = self.placeholder, !placeholder.isEmpty {
            self.placeholder = placeholder.localize()
        }
        
        if let text = text, !text.isEmpty {
            self.text = text.localize()
        }
    }
    
}

extension UITextView {
    
    /// Override awakeFromNib when is going visible, try search a key in JSON File
    /// If key match replace text, if can't match return the key (original text)
    /// Set title for UITextView
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let text = self.text, !text.isEmpty {
            self.text = text.localize()
        }
    }
    
}
