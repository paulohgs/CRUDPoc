//
//  ViewCoding.swift
//  CRUDPoc
//
//  Created by Paulo Henrique Gomes da Silva on 06/01/23.
//

import Foundation

protocol ViewCoding {
    func setupView()
    func setupConstraints()
    func setupHierarchy()
}

extension ViewCoding {
    func buildLayout() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }
}
