//
//  MainView.swift
//  MyCoffee
//
//  Created by Juan Hernandez on 4/20/21.
//

import SwiftUI

struct MainView: View {
    
    @State private var selection = 1
    
    init() {
            UITabBar.appearance().barTintColor = UIColor.black
        }
    var body: some View
    {
        GeometryReader{ geometry in
            TabView (selection: $selection){
            MyCoffeeTabView()
                .tabItem {
                    VStack{
                        Image(systemName: "homepod")
                        .accessibilityLabel("My Coffee")
                        }
                        }
                    .tag(1)

             FriendsTabView()
                 .tabItem {
                    VStack{
                        Image(systemName: "person.3")
                        .accessibilityLabel("Friends")
                        }
                     }
                     .tag(2)

            MeTabView()
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                        .accessibilityLabel("Profile")
                        }
                    }
                    .tag(3)
            GroupOrderMain()
                .tabItem {
                        VStack{
                            Image(systemName: "square.and.pencil")
                            .accessibilityLabel("My Coffee")
                            }
                    }
                    .tag(4)
            }
            .accentColor(Color("myCoffeeWhiteSnow"))
            
            // end TabView
        }
} // end body
} // end struct



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
