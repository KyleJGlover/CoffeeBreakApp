//
//  Home.swift
//  CoffeeBreakApp
//
//  Created by user197055 on 7/5/21.
//

import SwiftUI

struct Home: View {
    @ObservedObject var friendpeek: Friendpeek
    
    @EnvironmentObject var userProfile: Profile
    
    @ObservedObject var searchList: listProfiles = listProfiles()
    
    @State var searchQuery = ""
    
    
    @State var offset: CGFloat = 0
    
    @State var startOffset: CGFloat = 0
    
    
    @State var titleOffset: CGFloat = 0
    
    
    @State var titleBarHeight: CGFloat = 0
    
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        ZStack(alignment: .top){
            Color(.black)
            .edgesIgnoringSafeArea(.all)
            VStack{
                // moving the search bar to the top if user starts typing
                
                VStack{
                    
                    if searchQuery == ""{
                        
                        
                        HStack{
//
//                            (
//
//                                Text("Add Friends ")
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.primary)
//
//                            )
//                            .font(.largeTitle)
//                            .padding(.trailing, 150)
                            
                        }
                    }
                    
                    VStack{
                        
                        // Search Bar
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 23, weight: .bold))
                                .foregroundColor(.gray)
                            
                            TextField("Seach", text: $searchQuery)
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(Color.primary.opacity(0.05))
                        .cornerRadius(8)
                        .padding()
                        
                       
                    }
                    .offset(y: offset > 0 && searchQuery == "" ? (offset <= 95 ? -offset : -95) : 0)
                }
                .zIndex(1)
                .padding(.bottom,searchQuery == "" ? getOffset().height : 0)
                .background(
                
                    ZStack{
                        
                        let color = scheme == .dark ? Color.black : Color.white
                        
                        LinearGradient(gradient: .init(colors: [color,color,color,color,color.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                    }
                    .ignoresSafeArea()
                )
                
                .animation(.easeInOut,value: searchQuery != "")
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    VStack(spacing: 15){
                        
                                            
                        ForEach(searchQuery == "" ? friends : friends.filter{$0.name.lowercased().contains(searchQuery.lowercased())}){friend in
                            
                            
                            FriendRowView(friendpeek: friendpeek)
                        }
                    }
                    .padding(.top,10)
                    .padding(.top,searchQuery == "" ? titleBarHeight : 90)
                    // Getting Offset by using geometry Reader
                })
            }
        }.navigationBarTitle("Add Friends")
        .onAppear(perform: {
            searchList.grabListData()
        })
    }
    
//    ForEach(drinks.drinkList) { drink in
//        if drink.isFavorite ?? false{
//            NavigationLink(
//                destination: DetailsView(drink: drink).environmentObject(userProfile),
//                label: {
//                    VStack (alignment: .leading){
//                        Text("Name:\(drink.drinkName ?? "")")
//                            .font(.custom("Helvetica Neue", size: 10))
//                            .foregroundColor(.black)
//                        Text("Temperature:\(drink.temperature ?? "")")
//                            .font(.custom("Helvetica Neue", size: 10))
//                            .foregroundColor(.black)
//                    }.frame(width:120, height: 80)
//                    .padding(.leading, 0)
//                    .scaledToFit()
//                    .background(Color("myCoffeeTurquoise"))
//                    .border(Color.black)
//
//            })
//
//        }
//
//    }
    
    func getOffset()->CGSize{
        
        var size: CGSize = .zero
        
        let screenWidth = UIScreen.main.bounds.width / 2
        // since width is slow moving were multiplying with 1.5
        size.width = offset > 0 ? (offset * 1.5 <= (screenWidth - titleOffset) ? offset * 1.5 : (screenWidth - titleOffset)) : 0
        size.height = offset > 0 ? (offset <= 75 ? -offset : -75) : 0
        
        return size
    }
    
    //  shrinking title a bit when scrolling
    
    func getScale()->CGFloat{

        if offset > 0{
            let screenWidth = UIScreen.main.bounds.width
            
            let progress = 1 - (getOffset().width / screenWidth)
            
            return progress >= 0.9 ? progress : 0.9
        }
        else{
            return 1
        }
    }
}

struct Home_Previews: PreviewProvider {
    @ObservedObject static var friendpeek = Friendpeek (id:0, Name: "stephen", AboutMe: "I like Iced Coffee", Image: "animoji1");
    
    static var previews: some View {
        Home(friendpeek: friendpeek)
            .preferredColorScheme(.dark)
    }
}
