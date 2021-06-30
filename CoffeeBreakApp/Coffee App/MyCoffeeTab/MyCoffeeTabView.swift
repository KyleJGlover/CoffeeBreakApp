import SwiftUI

struct MyCoffeeTabView: View {
    
    let drinks = listDrinks()
    
    var body: some View {
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

                        listOfCoffeeSection().environmentObject(drinks)
                        
                        VStack{
                            
                        }.frame(height: 50)
                    }
                }.navigationBarTitle(Text("MyCoffee"))
            }
    }
}


struct MyCoffeeTabView_Previews: PreviewProvider {
    @State static var drinks = listDrinks()

    static var previews: some View {
        MyCoffeeTabView().environmentObject(drinks)
    }
}

