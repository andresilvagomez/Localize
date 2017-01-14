//
//  ViewController.swift
//  Example
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("hello.world".localize())
        print("name".localize(value: "Andres"))
        print("values".localize(values: "Andres", "Software Developer"))
        print("username".localize(dictionary: ["username": "andresilvagomez"]))
        print("level.one.two.three".localize())
        print("the.same.lavel".localize())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

