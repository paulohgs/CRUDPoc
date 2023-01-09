//
//  CrudViewmodel.swift
//  CRUDPoc
//
//  Created by Paulo Henrique Gomes da Silva on 06/01/23.
//

import Foundation

class CrudViewmodel {

    var users: [User] = []

    func createUser(userData: [String?]) -> User {
        guard let username = userData[1], let email = userData[0], let password = userData[2] else {
            return User(username: "", email: "", password: "")
        }
        let user = User(username: username, email: email, password: password)
        users.append(user)
        return user
    }

    func listAllUsers() {
        print(users)
        for user in users {
            print(user.username)
            print(user.email)
            print(user.id)
        }
    }
}
