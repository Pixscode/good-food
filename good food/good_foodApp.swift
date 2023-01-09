//
//  good_foodApp.swift
//  good food
//
//  Created by Zeynia Wax on 2022/12/20.
//

import SwiftUI

@main
struct good_foodApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {

            RootView(recipes: randomRecipeManager())
          .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
