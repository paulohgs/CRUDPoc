//
//  UserModel.swift
//  CRUDPoc
//
//  Created by Paulo Henrique Gomes da Silva on 09/01/23.
//

import Foundation

struct User: Identifiable {
    let id: UUID = UUID()
    let username: String
    let email: String
    let password: String
}
