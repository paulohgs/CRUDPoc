//
//  CrudStackView.swift
//  CRUDPoc
//
//  Created by Paulo Henrique Gomes da Silva on 09/01/23.
//

import UIKit

class CrudStackView: UIView {

    lazy var views: [UIView] = [usernameField, emailField, passwordField]

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

    lazy var stack = make(UIStackView(arrangedSubviews: views)) {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CrudStackView: ViewCoding {
    func setupView() {
        backgroundColor = .systemBackground
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func setupHierarchy() {
        addSubview(stack)
    }
}
