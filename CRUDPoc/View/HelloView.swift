//
//  HelloView.swift
//  CRUDPoc
//
//  Created by Paulo Henrique Gomes da Silva on 06/01/23.
//

import UIKit

class HelloView: UIView {

    lazy var helloLabel = make(UILabel()) {
        $0.font = .systemFont(ofSize: 24)
        $0.text = "Hello World"
        $0.textColor = .systemGray
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

extension HelloView: ViewCoding {
    func setupView() {
        backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        addSubview(helloLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
