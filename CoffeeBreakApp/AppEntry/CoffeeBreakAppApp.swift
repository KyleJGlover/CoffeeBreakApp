//
//  CoffeeBreakAppApp.swift
//  CoffeeBreakApp
//
//  Created by Kyle Glover on 6/25/21.
//

import SwiftUI

@main
struct CoffeeBreakAppApp: App {
    @ObservedObject var authentication = Authentication()
    @ObservedObject var userProfile = Profile()
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated{
                MainView()
                    .environmentObject(authentication)
                    .environmentObject(userProfile)
            } else {
                LoginView()
                .environmentObject(authentication)
                .environmentObject(userProfile)
            }
        }
    }
}
