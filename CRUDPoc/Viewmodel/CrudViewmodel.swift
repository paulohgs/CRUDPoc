//
//  CrudViewmodel.swift
//  CRUDPoc
//
//  Created by Paulo Henrique Gomes da Silva on 06/01/23.
//

import Foundation
import UIKit

class CrudViewmodel {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var users: Observable<[UserModel]> = Observable([])

    func createUser(userData: [String?]) {
        guard let username = userData[1], let email = userData[0], let password = userData[2] else {
            return
        }
        let newUser = UserModel(context: context)
        newUser.id = UUID()
        newUser.createdAt = Date()
        newUser.email = email
        newUser.username = username
        newUser.password = password

        do {
            try context.save()
            listAllUsers()
        } catch {
            print(error)
        }
    }

    func listAllUsers() {
        do {
            users.value = try context.fetch(UserModel.fetchRequest())
        } catch {
            print(error)
        }
    }
}
