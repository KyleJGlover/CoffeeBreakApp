//
//  SpecificFriends.swift
//  Friend Page
//
//  Created by user193062 on 4/28/21.
//

import SwiftUI



struct FriendsTabView: View {
    @State var Friend: [FriendInfo] = [
        FriendInfo(name: "Jamie", AboutMe: "I like Iced Coffee", DrinkList: "Iced Expresso"),
        FriendInfo(name: "Mike", AboutMe: "I love Fraps", DrinkList: "Frappuccino"),
        FriendInfo(name: "Jeremy", AboutMe: "Nitro's are the best", DrinkList: "Nitro"),
        FriendInfo(name: "Billy", AboutMe: "Everyone should try the Mazagran", DrinkList: "Mazagran"),
        FriendInfo(name: "William", AboutMe: "Cold Brew, forever!", DrinkList: "Cold Brew"),
        FriendInfo(name: "Sally", AboutMe: "I like Iced Coffee", DrinkList: "Mazagran"),
        FriendInfo(name: "Brent", AboutMe: "Everyone should have an Iced Caramel Macchiato once in there life!", DrinkList: "Iced Caramel Macchiato"),
        FriendInfo(name: "Christian", AboutMe: "Two Words: Mocha Smoothie", DrinkList: "Mocha"),
        FriendInfo(name: "Josh", AboutMe: "Banana Milk Coffee, TRUST ME!", DrinkList: "Banana Milk Coffee"),
        
    ]
    
var body: some View {
    GeometryReader{ geometry in
        NavigationView{
            VStack{
                ScrollView{
                    VStack{
                        ForEach(0 ..< Friend.count){num in
                            HStack{
                                NavigationLink(
                                    destination: FriendDetails(Friend:self.$Friend[num]),
                                    label:{
                                        Image("image 1")
                                            .resizable()
                                            .cornerRadius(5)
                                            .frame(width: 75.0, height: 75.0)
                                        Text(Friend[num].name)
                                           
                                    })
                                } .frame(width: geometry.size.width, height:100)
                            .background(Color.green)
                            .border(Color.black)
                            
                        }
                    }
                    
                }
            }.navigationTitle("My Friends")
        }.accentColor(.black)
//            List(Friend){ FriendInfo in
//                NavigationLink(
//                    destination: (FriendDetails(FriendInfo:FriendInfo)),
//                    label: {
//                        /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
//                    })
//              SpecificFrandzzz(FriendInfo: FriendInfo)
//
//                }
//
//            }.navigationTitle("Friends")
                        
         
        Spacer()
      }

}


struct FriendsTabView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsTabView()
    }
}
    

}

//struct SpecificFrandzzz: View {
//
//    let FriendInfo: FriendInfo
//
//    var body: some View {
//        List{
//            HStack{
//                VStack(alignment: .leading){
//                    Text(FriendInfo.name)
//                }
//            }
//
//        }
//    }
//}
//
//struct Top: View {
//
//    let TopFive: TopFive
//
//    var body: some View {
//        List{
//            HStack{
//                VStack(alignment: .leading){
//                    Text(TopFive.Top5)
//                }
//            }
//
//        }
//    }
//}

