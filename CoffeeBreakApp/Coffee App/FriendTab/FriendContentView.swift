//
//  ContentView.swift
//  CoffeeBreakApp
//
//  Created by user197055 on 7/5/21.
//

import SwiftUI

struct FriendContentView: View {
    @ObservedObject var friendpeek: Friendpeek
    var body: some View {

        FriendProfileView(friendpeek: friendpeek)
    }
}

struct FriendContentView_Previews: PreviewProvider {    @ObservedObject static var friendpeek = Friendpeek (id:0, Name: "stephen", AboutMe: "I like Iced Coffee", Image: "animoji1")

    
    static var previews: some View {
        FriendContentView (friendpeek: friendpeek)
        
    }
}
