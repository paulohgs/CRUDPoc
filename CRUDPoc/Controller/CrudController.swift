//
//  ViewController.swift
//  CRUDPoc
//
//  Created by Paulo Henrique Gomes da Silva on 06/01/23.
//

import UIKit

class ViewController: UIViewController {

    let crudView = CrudView()
    let crudViewmodel = CrudViewmodel()

    override func loadView() {
        view = crudView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        crudView.sendData = { [weak self] userData in
            let _ = self?.crudViewmodel.createUser(userData: userData)
        }
        crudViewmodel.users.bind { [weak self] _ in
            guard let users = self?.crudViewmodel.users.value else {
                return
            }
            print(users)
        }
    }
}

