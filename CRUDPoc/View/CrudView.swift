//
//  HelloView.swift
//  CRUDPoc
//
//  Created by Paulo Henrique Gomes da Silva on 06/01/23.
//

import UIKit

class CrudView: UIView {

    lazy var stackView = make(CrudStackView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    var sendData: ((_ userData: [String?] ) -> Void)?

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
        let userData: [String?] = [
            stackView.emailField.text,
            stackView.usernameField.text,
            stackView.passwordField.text
        ]
        sendData?(userData)
    }
}

extension CrudView: ViewCoding {
    func setupView() {
        backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        addSubview(stackView)
        addSubview(sendButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // stack constraints
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 10),
             // button constraints
            sendButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            sendButton.widthAnchor.constraint(equalToConstant: 135),
            sendButton.heightAnchor.constraint(equalToConstant: 35),
            sendButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
