//
//  UIViewComponentsWithDisabledAutoLocalize.swift
//  LocalizeTests
//
//  Copyright © 2019 @andresilvagomez.
//

import XCTest
import UIKit
import Localize

class UIViewComponentsWithDisabledAutoLocalize: XCTestCase {

    override func setUp() {
        super.setUp()
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "en")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // MARK: - UIBarButtonItem
    func testButtonItemWithLocalizeKey() {
        let button = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        button.localizeKey = "the.same.lavel"
        button.autoLocalize = false
        button.awakeFromNib()

        XCTAssertTrue(button.title == "")
    }

    func testButtonItemWithTextKey() {
        let button = UIBarButtonItem(title: "the.same.lavel", style: .plain, target: self, action: nil)
        button.autoLocalize = false
        button.awakeFromNib()

        XCTAssertTrue(button.title == "the.same.lavel")
    }

    func testButtonItemWithoutKeys() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        button.autoLocalize = false
        button.awakeFromNib()

        XCTAssertTrue(button.title == nil)
    }

    // MARK: - UIButton
    func testButtonWithLocalizeKey() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.localizeKey = "the.same.lavel"
        button.autoLocalize = false
        button.awakeFromNib()

        XCTAssertTrue(button.titleLabel?.text == nil)
    }

    func testButtonWithTextKey() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.titleLabel?.text = "the.same.lavel"
        button.autoLocalize = false
        button.awakeFromNib()

        XCTAssertTrue(button.titleLabel?.text == "the.same.lavel")
    }

    func testButtonWithoutKeys() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.autoLocalize = false
        button.awakeFromNib()

        XCTAssertTrue(button.titleLabel?.text == nil)
    }

    // MARK: - UILabel
    func testLabelWithLocalizeKey() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.localizeKey = "the.same.lavel"
        label.autoLocalize = false
        label.awakeFromNib()

        XCTAssertTrue(label.text == nil)
    }

    func testLabelWithTextKey() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = "the.same.lavel"
        label.autoLocalize = false
        label.awakeFromNib()

        XCTAssertTrue(label.text == "the.same.lavel")
    }

    func testLabelWithoutKeys() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.autoLocalize = false
        label.awakeFromNib()

        XCTAssertTrue(label.text == nil)
    }

    // MARK: - UINavigationItem
    func testNavigationItemWithLocalizeKey() {
        let item = UINavigationItem(title: "")
        item.localizeTitle = "the.same.lavel"
        item.localizePrompt = "the.same.lavel"
        item.autoLocalize = false
        item.awakeFromNib()

        XCTAssertTrue(item.title == "")
        XCTAssertTrue(item.prompt == nil)
    }

    func testNavigationItemWithTextKey() {
        let item = UINavigationItem(title: "the.same.lavel")
        item.prompt = "the.same.lavel"
        item.autoLocalize = false
        item.awakeFromNib()

        XCTAssertTrue(item.title == "the.same.lavel")
        XCTAssertTrue(item.prompt == "the.same.lavel")
    }

    func testNavigationItemWithoutKeys() {
        let item = UINavigationItem(title: "")
        item.autoLocalize = false
        item.awakeFromNib()

        XCTAssertTrue(item.title == "")
        XCTAssertTrue(item.prompt == nil)
    }

    // MARK: - UISearchBar
    func testSearchBarWithLocalizeKey() {
        let bar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bar.localizePlaceholder = "the.same.lavel"
        bar.localizePrompt = "the.same.lavel"
        bar.autoLocalize = false
        bar.awakeFromNib()

        XCTAssertTrue(bar.placeholder == nil)
        XCTAssertTrue(bar.prompt == nil)
    }

    func testSearchBarWithTextKey() {
        let bar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bar.placeholder = "the.same.lavel"
        bar.prompt = "the.same.lavel"
        bar.autoLocalize = false
        bar.awakeFromNib()

        XCTAssertTrue(bar.placeholder == "the.same.lavel")
        XCTAssertTrue(bar.prompt == "the.same.lavel")
    }

    func testSearchBarWithoutKeys() {
        let bar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bar.autoLocalize = false
        bar.awakeFromNib()

        XCTAssertTrue(bar.placeholder == nil)
        XCTAssertTrue(bar.prompt == nil)
    }

    // MARK: - UITabBarItem
    func testTabBarItemWithLocalizeKey() {
        let bar = UITabBarItem(title: "", image: nil, tag: 0)
        bar.localizeKey = "the.same.lavel"
        bar.autoLocalize = false
        bar.awakeFromNib()

        XCTAssertTrue(bar.title == "")
    }

    func testTabBarItemWithTextKey() {
        let bar = UITabBarItem(title: "the.same.lavel", image: nil, tag: 0)
        bar.autoLocalize = false
        bar.awakeFromNib()

        XCTAssertTrue(bar.title == "the.same.lavel")
    }

    func testTabBarItemWithoutKeys() {
        let bar = UITabBarItem(title: "", image: nil, tag: 0)
        bar.autoLocalize = false
        bar.awakeFromNib()

        XCTAssertTrue(bar.title == "")
    }

    // MARK: - UITextField
    func testTextFieldWithLocalizeKey() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.localizeText = "the.same.lavel"
        textField.localizePlaceholder = "the.same.lavel"
        textField.autoLocalize = false
        textField.awakeFromNib()

        XCTAssertTrue(textField.text == "")
        XCTAssertTrue(textField.placeholder == nil)
    }

    func testTextFieldWithTextKey() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.text = "the.same.lavel"
        textField.placeholder = "the.same.lavel"
        textField.autoLocalize = false
        textField.awakeFromNib()

        XCTAssertTrue(textField.text == "the.same.lavel")
        XCTAssertTrue(textField.placeholder == "the.same.lavel")
    }

    func testTextFieldWithoutKeys() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.autoLocalize = false
        textField.awakeFromNib()

        XCTAssertTrue(textField.text == "")
        XCTAssertTrue(textField.placeholder == nil)
    }

    // MARK: - UITextView
    func testTextViewWithLocalizeKey() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textView.localizeKey = "the.same.lavel"
        textView.autoLocalize = false
        textView.awakeFromNib()

        XCTAssertTrue(textView.text == "")
    }

    func testTextViewWithTextKey() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textView.text = "the.same.lavel"
        textView.autoLocalize = false
        textView.awakeFromNib()

        XCTAssertTrue(textView.text == "the.same.lavel")
    }

    func testTextViewWithoutKeys() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textView.autoLocalize = false
        textView.awakeFromNib()

        XCTAssertTrue(textView.text == "")
    }

    // MARK: - UISegmentedControl
    func testSegmentedControlWithLocalizeKey() {
        let segment = UISegmentedControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        segment.insertSegment(withTitle: "", at: 0, animated: false)
        segment.insertSegment(withTitle: "", at: 1, animated: false)
        segment.localizeKey = "one, two"
        segment.autoLocalize = false
        segment.awakeFromNib()

        XCTAssertTrue(segment.titleForSegment(at: 0) == "")
        XCTAssertTrue(segment.titleForSegment(at: 1) == "")
    }

    func testSegmentedControlWithLocalizeKeyBased() {
        let segment = UISegmentedControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        segment.insertSegment(withTitle: "", at: 0, animated: false)
        segment.insertSegment(withTitle: "", at: 1, animated: false)
        segment.localizeKey = "segment.base: one, two"
        segment.autoLocalize = false
        segment.awakeFromNib()

        XCTAssertTrue(segment.titleForSegment(at: 0) == "")
        XCTAssertTrue(segment.titleForSegment(at: 1) == "")
    }

    func testSegmentedControlWithTextKey() {
        let segment = UISegmentedControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        segment.insertSegment(withTitle: "segment.base.one", at: 0, animated: false)
        segment.insertSegment(withTitle: "segment.base.two", at: 1, animated: false)
        segment.autoLocalize = false
        segment.awakeFromNib()

        XCTAssertTrue(segment.titleForSegment(at: 0) == "segment.base.one")
        XCTAssertTrue(segment.titleForSegment(at: 1) == "segment.base.two")
    }

    func testSegmentedControlWithoutKeys() {
        let segment = UISegmentedControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        segment.insertSegment(withTitle: "", at: 0, animated: false)
        segment.insertSegment(withTitle: "", at: 1, animated: false)
        segment.autoLocalize = false
        segment.awakeFromNib()

        XCTAssertTrue(segment.titleForSegment(at: 0) == "")
        XCTAssertTrue(segment.titleForSegment(at: 1) == "")
    }
}
