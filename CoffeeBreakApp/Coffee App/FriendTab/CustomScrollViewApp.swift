//
//  CustomScrollViewApp.swift
//  CoffeeBreakApp
//
//  Created by user197055 on 7/5/21.
//

import SwiftUI



//@main
struct CustomScrollViewApp: App {
    
    @ObservedObject static var friendpeek = Friendpeek (id:0, Name: "stephen", AboutMe: "I like Iced Coffee", Image: "animoji3")


    
var body: some Scene {
        
    WindowGroup{
            
        FriendContentView(friendpeek: CustomScrollViewApp.friendpeek)
        }
    }
}
