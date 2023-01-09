//
//  HelloView.swift
//  CRUDPoc
//
//  Created by Paulo Henrique Gomes da Silva on 06/01/23.
//

import UIKit

class CrudView: UIView {

    var sendData: ((_ userData: [String?] ) -> Void)?

    lazy var usernameField = make(UITextField()) {
        $0.textColor = .white
        $0.layer.cornerRadius = 10
        $0.keyboardType = .emailAddress
        $0.borderStyle = .roundedRect
        $0.autocorrectionType = .no
        $0.clipsToBounds = true
        $0.layer.masksToBounds = true
        $0.placeholder = "Digite seu usuário:"
        $0.backgroundColor = .systemGray2
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    lazy var emailField = make(UITextField()) {
        $0.textColor = .white
        $0.layer.cornerRadius = 10
        $0.keyboardType = .emailAddress
        $0.borderStyle = .roundedRect
        $0.autocorrectionType = .no
        $0.clipsToBounds = true
        $0.layer.masksToBounds = true
        $0.placeholder = "Digite seu email:"
        $0.backgroundColor = .systemGray2
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    lazy var passwordField = make(UITextField()) {
        $0.isSecureTextEntry = true
        $0.textColor = .white
        $0.layer.cornerRadius = 10
        $0.keyboardType = .default
        $0.borderStyle = .roundedRect
        $0.autocorrectionType = .no
        $0.clipsToBounds = true
        $0.layer.masksToBounds = true
        $0.placeholder = "Digite sua senha:"
        $0.backgroundColor = .systemGray2
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    lazy var sendButton = make(UIButton()) {
        $0.addTarget(self, action: #selector(sendDataToController), for: .touchUpInside)
        $0.configuration = .borderedProminent()
        $0.layer.cornerRadius  = 10
        $0.layer.masksToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Criar usuário", for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func sendDataToController() {
        let userData: [String?] = [emailField.text, usernameField.text, passwordField.text]
        sendData?(userData)
    }

}

extension CrudView: ViewCoding {
    func setupView() {
        backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        addSubview(usernameField)
        addSubview(emailField)
        addSubview(passwordField)
        addSubview(sendButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // username constraints
            usernameField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            usernameField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            usernameField.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
            // email constraints
            emailField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            emailField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            emailField.heightAnchor.constraint(equalToConstant: 35),
            emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 15),
            // password constraints
            passwordField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            passwordField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            passwordField.heightAnchor.constraint(equalTo: emailField.heightAnchor),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15),
            // button constraints
            sendButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sendButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            sendButton.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
