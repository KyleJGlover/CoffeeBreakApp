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
            TabView (selection: $selection){
            MyCoffeeTabView()
                .tabItem {
                    VStack{
                        Image(systemName: "macpro.gen2")
                            .font(.title)
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
            .navigationBarColor(backgroundColor: .black, titleColor: .white)
            
            // end TabView
} // end body
} // end struct



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
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
 
//struct TabView: View {
//    var views: [TabBarItem]
//    @State var selectedIndex: Int = 0
//
//    init(_ views: [TabBarItem]) {
//        self.views = views
//    }
//
//    var body: some View {
//        ZStack {
//            ForEach(views.indices) { i in
//                self.views[i].view
//                    .opacity(self.selectedIndex == i ? 1 : 0)
//            }
//            GeometryReader { geometry in
//                VStack {
//                    Spacer()
//                    ZStack(alignment: .top) {
//                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
//                            .frame(height: 70 + geometry.safeAreaInsets.bottom)
//
//                        HStack {
//                            ForEach(self.views.indices) { i in
//                                Button(action: {
//                                    self.selectedIndex = i
//                                }) {
//                                    VStack {
//                                        if self.selectedIndex == i {
//                                            self.views[i].image
//                                                .foregroundColor(.white)
//                                                 .padding(.top,10)
//                                                .font(.title)
//                                        } else {
//                                            self.views[i].image
//                                                .foregroundColor(Color.white.opacity(0.4))
//                                                .padding(.top,10)
//                                               .font(.title)
//                                        }
//                                        Text(self.views[i].title)
//                                            .foregroundColor(.white)
//                                            .font(Font.system(size: 16, weight: .bold))
//                                            .padding(.top,10)
//                                            .opacity(0.5)
//                                    }
//                                    .frame(maxWidth: .infinity)
//                                }
//                            }
//                        }
//                    }
//                }
//                .edgesIgnoringSafeArea(.bottom)
//                .animation(.easeInOut)
//            }
//        }
//    }
//}
//
//struct TabBarItem {
//    var view: AnyView
//    var image: Image
//    var title: String
//
//    init<V: View>(view: V, image: Image, title: String) {
//        self.view = AnyView(view)
//        self.image = image
//        self.title = title
//    }
//}
//
//
///// Main View
//struct ContentView: View {
//  var body: some View {
//    TabView([
//      TabBarItem(view: Text("This is home screen"),
//                 image: Image(systemName:"house.fill"),
//                 title: "home"),
//      TabBarItem(view: Text("2"),
//                 image: Image(systemName:"heart.fill"),
//                 title: "favorite"),
//
//    ])
//  }
