//
//  UILabel.swift
//  JsonLocalizable
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let title = self.title , !title.isEmpty {
            self.title = title.localize()
        }
    }
    
}

extension UIButton {
    
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
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let text = text , !text.isEmpty {
            self.text = text.localize()
        }
        
    }
    
}

extension UINavigationItem {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let title = self.title , !title.isEmpty {
            self.title = title.localize()
        }
        
        if let prompt = self.prompt , !prompt.isEmpty {
            self.prompt = prompt.localize()
        }
    }
    
}

extension UISearchBar {
    
    open override  func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let placeholder = self.placeholder , !placeholder.isEmpty {
            self.placeholder = NSLocalizedString(placeholder, comment: "")
        }
        
        if let prompt = self.prompt , !prompt.isEmpty {
            self.prompt = prompt.localize()
        }
        
    }
}

extension UISegmentedControl {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        for index in 0...(self.numberOfSegments-1) {
            if let title = self.titleForSegment(at: index) , !title.isEmpty {
                self.setTitle(title.localize(), forSegmentAt: index)
            }
        }
        
    }
    
}

extension UITabBarItem {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let title = self.title , !title.isEmpty {
            self.title = title.localize()
        }
    }
}

extension UITextField {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let placeholder = self.placeholder, !placeholder.isEmpty {
            self.placeholder = placeholder.localize()
        }
        
        if let text = text , !text.isEmpty {
            self.text = text.localize()
        }
        
    }
}

extension UITextView {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.shared.localizableInterface == .classes {
            return
        }
        
        if let text = self.text , !text.isEmpty {
            self.text = text.localize()
        }
    }
    
}
