//
//  CDPerson+CoreDataProperties.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 29/11/20.
//
//

import Foundation
import CoreData


extension CDPerson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPerson> {
        return NSFetchRequest<CDPerson>(entityName: "CDPerson")
    }

    @NSManaged public var confirmpassword: String?
    @NSManaged public var emailid: String?
    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var password: String?
    func convertToPerson() -> Person {
        return Person (firstname: self.firstname, lastname: self.lastname, emailid: self.emailid, password: self.password, confirmPassword: self.confirmpassword)
    }
}

extension CDPerson : Identifiable {

}
