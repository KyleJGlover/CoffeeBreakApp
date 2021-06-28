import SwiftUI

struct MyCoffeeTabView: View {
    
    @State var userDrinks = FetchDrinks()

    //top 5 ranking drinks 5 being the most and 1 being the least.
    //for friend drinks we need the username/drink type/unique ID(passes)
    
//    func addFriendsArray(){
//        ForEach(0 ..< 15) {num in
//            userDrinks.append(userDrinkInfo())
//        }
//    }
    
    var body: some View {
        
        let drinks = listDrinks()
        
            NavigationView {
                ZStack{
                    Color("myCoffeeControlColor")
                    .edgesIgnoringSafeArea(.all)
                    VStack {
                        //FriendRecentDrinkHScroll()
                        
                        CreateNewDrinkBtnSection()
                            .environmentObject(drinks)
                            .padding()
                            .padding(.top, 30)

                        listOfCoffeeSection()
                        
                        VStack{
                            
                        }.frame(height: 50)
                    }
                }.navigationBarTitle(Text("MyCoffee"))
            }
    }
}


struct MyCoffeeTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyCoffeeTabView()
    }
}

