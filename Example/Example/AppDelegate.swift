//
//  AppDelegate.swift
//  Example
//
//  Copyright © 2017 @andresilvagomez.
//

import UIKit
import Localize

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
        -> Bool {

        let localize = Localize.shared
        // Set your localize provider.
        localize.update(provider: .json)
        // Set your file name
        localize.update(fileName: "lang")
        // Set your default languaje.
        localize.update(defaultLanguage: "fr")
        // If you want change a user language, different to default in phone use thimethod.
        localize.update(language: "en")
        // If you want remove storaged languaje use
        localize.resetLanguage()
        // The used language
        print(localize.currentLanguage)
        // List of aviable languajes
        print(localize.availableLanguages)

        // Or you can use static methods for all

        Localize.update(fileName: "lang")
        Localize.update(defaultLanguage: "fr")
        Localize.update(language: "en-DE")

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}
