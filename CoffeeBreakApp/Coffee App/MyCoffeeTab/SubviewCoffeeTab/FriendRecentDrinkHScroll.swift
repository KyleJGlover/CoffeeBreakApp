import SwiftUI



struct FriendRecentDrinkHScroll: View{
    
    let drinks = listDrinks()

    
    var body: some View{
        ScrollView (.horizontal){
            VStack{
                HStack (spacing: 0) {
                    ForEach(0 ..< 15) { number in
                        NavigationLink(
                            destination: DetailsView()
                                .environmentObject(drinks)
                                ,
                            label: {
                                FriendView()
                            })
                    }
                }.scaledToFit()
            }
            .padding(.top, 45)
            .padding(.leading, 0)
            
        }.frame(alignment:.leading)
        .background(Color("myCoffeeLightBrown"))
    }
}


struct FriendView: View{
    var body: some View{
        VStack (alignment: .center){
            VStack{
                VStack{
                    Image(systemName: "person")
                        .resizable()
                        .cornerRadius(5)
                        .frame(width: 65.0, height: 65.0)
                        
                }.frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.white)
                    
                VStack(alignment:.center){
                    Text("Kyle Glover")
                    .padding(0)
                    .font(.custom("Helvetica Neue", size: 15))
                    .foregroundColor(.white)
                    .fixedSize()
                Text("Chocolate Swirl")
                    .font(.custom("Helvetica Neue", size: 14))
                    .foregroundColor(Color(.white))
                }.frame(height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }.padding(10)
    }
    
}

struct RecentDrinksViewSection_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FriendRecentDrinkHScroll()
        }
    }
}

