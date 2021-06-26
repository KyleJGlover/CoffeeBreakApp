//
//  CoffeeBreakAppApp.swift
//  CoffeeBreakApp
//
//  Created by Kyle Glover on 6/25/21.
//

import SwiftUI

@main
struct CoffeeBreakAppApp: App {
    @StateObject var authentication = Authentication()
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated{
                MainView()
                    .environmentObject(authentication)
            } else {
                LoginView()
                .environmentObject(authentication)
            }
        }
    }
}
