//
//  Stock_Tracker_And_NewsApp.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/17/24.
//

import SwiftUI

@main
struct Stock_Tracker_And_NewsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NewsView()
        }
    }
}
