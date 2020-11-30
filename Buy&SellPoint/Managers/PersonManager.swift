//
//  PersonManager.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 29/11/20.
//

import Foundation
import CoreData
struct PersonManager {
    private let _personDataRepository = PersonDataRepository()
    func createPerson(person:Person) {
        _personDataRepository.create(person: person)
        PersistentStorage.shared.saveContext()
    }
    func fetchPerso() -> [Person]? {
        return _personDataRepository.getAll()
    }
}

