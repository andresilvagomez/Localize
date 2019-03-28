//
//  ViewController.swift
//  Example
//
//  Copyright © @andresilvagomez.
//

import UIKit
import Localize

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()

        let locale = Locale.preferredLanguages.first?.components(separatedBy: "-").first?.lowercased() ?? "es"

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(localize),
            name: NSNotification.Name(localizeChangeNotification),
            object: nil
        )

        Localize.shared.update(language: locale)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func localize() {
        print("hello.world".localize())
        print("name".localize(value: "Andres"))
        print("values".localize(values: "Andres", "Software Developer"))
        print("username".localize(dictionary: ["username": "andresilvagomez"]))
        print("level.one.two.three".localize())
        print("the.same.lavel".localize())
    }

    @IBAction func updateLanguage(_ sender: Any) {
        let actionSheet = UIAlertController(
            title: nil,
            message: "app.update.language".localize(),
            preferredStyle: UIAlertControllerStyle.actionSheet
        )

        for language in Localize.availableLanguages {
            let displayName = Localize.displayNameForLanguage(language)
            let languageAction = UIAlertAction(
                title: displayName,
                style: .default,
                handler: { (_: UIAlertAction!) -> Void in

                    Localize.update(language: language)
            })
            actionSheet.addAction(languageAction)
        }
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: UIAlertActionStyle.cancel,
            handler: nil
        )

        actionSheet.addAction(cancelAction)
        self.present(actionSheet, animated: true, completion: nil)
    }

    func customProtocol() {
        let provider = CustomLocalize()
        Localize.update(provider: .custom(provider: provider))
        print("test.custom.provider".localized)
    }
}
