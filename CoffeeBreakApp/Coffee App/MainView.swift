//
//  MainView.swift
//  MyCoffee
//
//  Created by Juan Hernandez on 4/20/21.
//

import SwiftUI

struct MainView: View {
        
    @EnvironmentObject var userProfile:Profile
    
    @ObservedObject static var friendpeek = Friendpeek (id:0, Name: "stephen", AboutMe: "I like Iced Coffee", Image: "animoji3")
    @State private var selection = 1
    
    init() {
        
            UITabBar.appearance().barTintColor = UIColor.black
        }
    
    var body: some View
    {
            TabView (selection: $selection){
                
            MyCoffeeTabView()
                .environmentObject(userProfile)
                .tabItem {
                    VStack{
                        Image(systemName: "macpro.gen2")
                        .accessibilityLabel("My Coffee")
                    }
                }
                .tag(1)

            FriendContentView(friendpeek: MainView.friendpeek)
                .environmentObject(userProfile)
                .tabItem {
                    VStack{
                        Image(systemName: "person.3")
                        .accessibilityLabel("Friends")
                    }
                 }
                 .tag(2)

            MeTabView(friendpeek: MainView.friendpeek)
                .environmentObject(userProfile)
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                        .accessibilityLabel("Profile")
                    }
                }
                .tag(3)
            GroupOrderMain()
                .environmentObject(userProfile)
                .tabItem {
                    VStack{
                        Image(systemName: "square.and.pencil")
                        .accessibilityLabel("My Coffee")
                    }
                }
                .tag(4)
            }
            .accentColor(Color("myCoffeeWhiteSnow"))
            .navigationBarColor(backgroundColor: .black, titleColor: .white)
            
            // end TabView
} // end body
} // end struct



struct MainView_Previews: PreviewProvider {
    @ObservedObject static var userProfile: Profile = Profile()
    static var previews: some View {
        MainView().environmentObject(userProfile)
    }
}


struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

