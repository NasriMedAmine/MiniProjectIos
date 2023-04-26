//
//  SwiftUI2App.swift
//  SwiftUI2
//
//  Created by Mac Mini 10 on 29/3/2023.
//

import SwiftUI

@main
struct SwiftUI2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AddDonation()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
