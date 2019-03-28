//
//  UIViewComponentsES.swift
//  LocalizeTests
//
//  Copyright © 2018 @andresilvagomez.
//

import XCTest
import UIKit
import Localize

class UIViewComponentsES: XCTestCase {

    override func setUp() {
        super.setUp()
        Localize.update(provider: .json)
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "es")
    }

    // MARK: - UIBarButtonItem
    func testButtonItemWithLocalizeKey() {
        let button = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        button.localizeKey = "the.same.lavel"
        button.localize()

        XCTAssertTrue(button.title == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testButtonItemWithTextKey() {
        let button = UIBarButtonItem(title: "the.same.lavel", style: .plain, target: self, action: nil)
        button.localize()

        XCTAssertTrue(button.title == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testButtonItemWithoutKeys() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        button.localize()

        XCTAssertTrue(button.title == nil)
    }

    // MARK: - UIButton
    func testButtonWithLocalizeKey() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.localizeKey = "the.same.lavel"
        button.localize()

        XCTAssertTrue(button.titleLabel?.text == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testButtonWithTextKey() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.titleLabel?.text = "the.same.lavel"
        button.localize()

        XCTAssertTrue(button.titleLabel?.text == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testButtonWithoutKeys() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.localize()

        XCTAssertTrue(button.titleLabel?.text == "")
    }

    // MARK: - UILabel
    func testLabelWithLocalizeKey() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.localizeKey = "the.same.lavel"
        label.localize()

        XCTAssertTrue(label.text == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testLabelWithTextKey() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = "the.same.lavel"
        label.localize()

        XCTAssertTrue(label.text == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testLabelWithoutKeys() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.localize()

        XCTAssertTrue(label.text == nil)
    }

    // MARK: - UINavigationItem
    func testNavigationItemWithLocalizeKey() {
        let item = UINavigationItem(title: "")
        item.localizeTitle = "the.same.lavel"
        item.localizePrompt = "the.same.lavel"
        item.localize()

        XCTAssertTrue(item.title == "Esto es una internazionalizacion en el mismo nivel")
        XCTAssertTrue(item.prompt == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testNavigationItemWithTextKey() {
        let item = UINavigationItem(title: "the.same.lavel")
        item.prompt = "the.same.lavel"
        item.localize()

        XCTAssertTrue(item.title == "Esto es una internazionalizacion en el mismo nivel")
        XCTAssertTrue(item.prompt == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testNavigationItemWithoutKeys() {
        let item = UINavigationItem(title: "")
        item.localize()

        XCTAssertTrue(item.title == "")
        XCTAssertTrue(item.prompt == nil)
    }

    // MARK: - UISearchBar
    func testSearchBarWithLocalizeKey() {
        let bar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bar.localizePlaceholder = "the.same.lavel"
        bar.localizePrompt = "the.same.lavel"
        bar.localize()

        XCTAssertTrue(bar.placeholder == "Esto es una internazionalizacion en el mismo nivel")
        XCTAssertTrue(bar.prompt == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testSearchBarWithTextKey() {
        let bar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bar.placeholder = "the.same.lavel"
        bar.prompt = "the.same.lavel"
        bar.localize()

        XCTAssertTrue(bar.placeholder == "Esto es una internazionalizacion en el mismo nivel")
        XCTAssertTrue(bar.prompt == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testSearchBarWithoutKeys() {
        let bar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bar.localize()

        XCTAssertTrue(bar.placeholder == nil)
        XCTAssertTrue(bar.prompt == nil)
    }

    // MARK: - UITabBarItem
    func testTabBarItemWithLocalizeKey() {
        let bar = UITabBarItem(title: "", image: nil, tag: 0)
        bar.localizeKey = "the.same.lavel"
        bar.localize()

        XCTAssertTrue(bar.title == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testTabBarItemWithTextKey() {
        let bar = UITabBarItem(title: "the.same.lavel", image: nil, tag: 0)
        bar.localize()

        XCTAssertTrue(bar.title == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testTabBarItemWithoutKeys() {
        let bar = UITabBarItem(title: "", image: nil, tag: 0)
        bar.localize()

        XCTAssertTrue(bar.title == "")
    }

    // MARK: - UITextField
    func testTextFieldWithLocalizeKey() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.localizeText = "the.same.lavel"
        textField.localizePlaceholder = "the.same.lavel"
        textField.localize()

        XCTAssertTrue(textField.text == "Esto es una internazionalizacion en el mismo nivel")
        XCTAssertTrue(textField.placeholder == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testTextFieldWithTextKey() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.text = "the.same.lavel"
        textField.placeholder = "the.same.lavel"
        textField.localize()

        XCTAssertTrue(textField.text == "Esto es una internazionalizacion en el mismo nivel")
        XCTAssertTrue(textField.placeholder == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testTextFieldWithoutKeys() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.localize()

        XCTAssertTrue(textField.text == "")
        XCTAssertTrue(textField.placeholder == nil)
    }

    // MARK: - UITextView
    func testTextViewWithLocalizeKey() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textView.localizeKey = "the.same.lavel"
        textView.localize()

        XCTAssertTrue(textView.text == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testTextViewWithTextKey() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textView.text = "the.same.lavel"
        textView.localize()

        XCTAssertTrue(textView.text == "Esto es una internazionalizacion en el mismo nivel")
    }

    func testTextViewWithoutKeys() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textView.localize()

        XCTAssertTrue(textView.text == "")
    }

    // MARK: - UISegmentedControl
    func testSegmentedControlWithLocalizeKey() {
        let segment = UISegmentedControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        segment.insertSegment(withTitle: "", at: 0, animated: false)
        segment.insertSegment(withTitle: "", at: 1, animated: false)
        segment.localizeKey = "one, two"
        segment.localize()

        XCTAssertTrue(segment.titleForSegment(at: 0) == "Primero")
        XCTAssertTrue(segment.titleForSegment(at: 1) == "Segundo")
    }

    func testSegmentedControlWithLocalizeKeyBased() {
        let segment = UISegmentedControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        segment.insertSegment(withTitle: "", at: 0, animated: false)
        segment.insertSegment(withTitle: "", at: 1, animated: false)
        segment.localizeKey = "segment.base: one, two"
        segment.localize()

        XCTAssertTrue(segment.titleForSegment(at: 0) == "Primero")
        XCTAssertTrue(segment.titleForSegment(at: 1) == "Segundo")
    }

    func testSegmentedControlWithTextKey() {
        let segment = UISegmentedControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        segment.insertSegment(withTitle: "segment.base.one", at: 0, animated: false)
        segment.insertSegment(withTitle: "segment.base.two", at: 1, animated: false)
        segment.localize()

        XCTAssertTrue(segment.titleForSegment(at: 0) == "Primero")
        XCTAssertTrue(segment.titleForSegment(at: 1) == "Segundo")
    }

    func testSegmentedControlWithoutKeys() {
        let segment = UISegmentedControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        segment.insertSegment(withTitle: "", at: 0, animated: false)
        segment.insertSegment(withTitle: "", at: 1, animated: false)
        segment.localize()

        XCTAssertTrue(segment.titleForSegment(at: 0) == "")
        XCTAssertTrue(segment.titleForSegment(at: 1) == "")
    }
}
