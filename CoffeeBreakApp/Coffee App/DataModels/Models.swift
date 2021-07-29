import Foundation
import SwiftUI





class FriendInfo: Identifiable {
    let id = UUID()
    var name: String
    var AboutMe: String
    var DrinkList: String
    
    init(name: String, AboutMe: String, DrinkList: String) {
        self.name = name
        self.AboutMe = AboutMe
        self.DrinkList = DrinkList
    }
    
}

