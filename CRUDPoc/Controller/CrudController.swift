//
//  ViewController.swift
//  CRUDPoc
//
//  Created by Paulo Henrique Gomes da Silva on 06/01/23.
//

import UIKit

class ViewController: UIViewController {

    let helloView = HelloView()

    override func loadView() {
        view = helloView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

