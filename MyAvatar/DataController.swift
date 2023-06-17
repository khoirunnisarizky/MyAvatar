//
//  DataController.swift
//  MyAvatar
//
//  Created by khoirunnisa' rizky noor fatimah on 17/06/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    // TODO: Add a single property of the type NSPersistentContainer
    // It is responsible for loading a data model and giving us access to the data inside
    /// the “NS” part is short for “NeXTSTEP”, which was a huge operating system that Apple acquired when they brought Steve Jobs back into the fold in 1997 – Core Data has some really old foundations!
    let container = NSPersistentContainer(name: "AvatarData")
    
    // TODO: Load data model
    // To actually load the data model we need to call loadPersistentStores() on our container, which tells Core Data to access our saved data according to the data model in AvatarData.xcdatamodeld
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
}

