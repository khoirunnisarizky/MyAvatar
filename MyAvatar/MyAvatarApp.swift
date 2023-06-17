//
//  MyAvatarApp.swift
//  MyAvatar
//
//  Created by khoirunnisa' rizky noor fatimah on 19/03/23.
//

import SwiftUI

@main
struct MyAvatarApp: App {
    // TODO: Store Core Data inside the SwiftUI environment
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            // TODO: Add core data modifier
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
