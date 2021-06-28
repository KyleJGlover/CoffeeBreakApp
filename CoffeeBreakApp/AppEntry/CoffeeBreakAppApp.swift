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
    @StateObject var userDrinks = userDrinkInfo()
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated{
                MainView()
                    .environmentObject(userDrinks)
                    .environmentObject(authentication)
            } else {
                LoginView()
                .environmentObject(authentication)
            }
        }
    }
}
