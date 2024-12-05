//
//  Roomie_2024App.swift
//  Roomie 2024
//
//  Created by Melvin Estudillo on 10/29/24.
//

import Foundation
import Swift
import SwiftUI
import FirebaseCore
@main
struct Roomie_2024App: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
