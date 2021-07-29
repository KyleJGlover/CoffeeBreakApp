import SwiftUI

struct MyCoffeeTabView: View {
    
    @EnvironmentObject var userProfile:Profile
    
    @ObservedObject var drinks = listDrinks()
    
    var body: some View {
       NavigationView {
                ZStack{
                    Color("myCoffeeControlColor")
                    .edgesIgnoringSafeArea(.all)
                    VStack {
                        //FriendRecentDrinkHScroll()
                        
                        CreateNewDrinkBtn().environmentObject(userProfile)
                            
                            .padding()
                            .padding(.top, 30)

                        listOfCoffeeSection(drinks: drinks).environmentObject(userProfile)
                        
                        VStack{
                            
                        }.frame(height: 50)
                    }
                }.navigationBarTitle(Text("MyCoffee"))
                .onAppear(perform: {
                     drinks.grabListData(profile_id: userProfile.profile_id)
                })
       }
    }
   
}


struct MyCoffeeTabView_Previews: PreviewProvider {
    @State static var drinks = listDrinks()

    static var previews: some View {
        MyCoffeeTabView().environmentObject(drinks)
    }
}

