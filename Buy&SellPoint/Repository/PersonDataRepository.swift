//
//  PersonDataRepository.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 29/11/20.
//

import Foundation
import CoreData
protocol PersonRepositry {
    func create(person : Person)
    func getAll () -> [Person]?
}

struct PersonDataRepository : PersonRepositry {
    func create(person: Person) {
        let cdPerson = CDPerson (context: PersistentStorage.shared.context)
        cdPerson.firstname = person.firstname
        cdPerson.lastname = person.lastname
        cdPerson.emailid = person.emailid
        cdPerson.password = person.password
        cdPerson.confirmpassword = person.confirmPassword
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Person]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDPerson.self)
        var person : [Person] = []
        result?.forEach({(cdPerson) in
                        person.append(cdPerson.convertToPerson())
                        })
        return person
    }
    }

