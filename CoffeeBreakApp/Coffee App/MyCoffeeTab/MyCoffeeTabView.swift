import SwiftUI

struct MyCoffeeTabView: View {
    
    @State var userDrinks = FetchDrinks()

    //top 5 ranking drinks 5 being the most and 1 being the least.
    @State var friendUser: [friendUserDrinkInfo] = []
    //for friend drinks we need the username/drink type/unique ID(passes)
    
//    func addFriendsArray(){
//        ForEach(0 ..< 15) {num in
//            userDrinks.append(userDrinkInfo())
//        }
//    }
    
    var body: some View {
            
            NavigationView {
                ZStack{
                    VStack {
                        RecentDrinksViewSection()
                        Spacer()
                        VStack (alignment:.center){
                            CreateNewDrinkBtnSection()
                        }.frame(height:50)
                        Spacer()
                        VStack{
                            listOfCoffeeSection()
                        }
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height)
                }.background(Color("myCoffeeControlColor"))
                .edgesIgnoringSafeArea(.all)
            }.accentColor(.black)
            .navigationBarTitle(Text("MyCoffee"), displayMode: .automatic)
            
        
    }
}


struct MyCoffeeTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyCoffeeTabView()
    }
}

