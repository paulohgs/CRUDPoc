//
//  UserModel+CoreDataProperties.swift
//  CRUDPoc
//
//  Created by Paulo Henrique Gomes da Silva on 10/01/23.
//
//

import Foundation
import CoreData


extension UserModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserModel> {
        return NSFetchRequest<UserModel>(entityName: "UserModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var createdAt: Date?

}

extension UserModel : Identifiable {

}
