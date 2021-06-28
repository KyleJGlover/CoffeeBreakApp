import SwiftUI

struct listOfCoffeeSection: View{
    
    @EnvironmentObject var drinks: listDrinks
    
    
    
    var body:some View{
        HStack(alignment:.center){
            Spacer()
            VStack{
                Text("Top 5")
                    .frame(width:120, height:30)
                    .foregroundColor(Color.white)
                    .font(.custom("Helvetica Neue", size: 20))
                    .background(Color.black)
                    .border(Color.white)
                ScrollView (.vertical){
//                    ForEach(0 ..< 5) { number in
                        
                        
                        MyDrinkView().environmentObject(drinks)
                        
//                    }
                }
                .border(Color.black)
                NavigationLink(
                    destination: addOrRemoveFavDrink(),
                        label: {
                            Spacer()
                            Text("Add or Remove")
                                .font(.system(size: 24, weight: .medium, design: .default))
                                .frame(minWidth:0, maxWidth:.infinity)
                                .foregroundColor(Color("myCoffeeWhiteSnow"))
                                .background(Color.black)
                                .border(Color.white)
                            Spacer()
                })
                
            }
            
            Spacer()
            //Center of the Page
            Image(systemName:"arrow.left.arrow.right")
                .resizable()
                .frame(width: 75.0, height: 75.0, alignment: .center)
            
            Spacer()
            //Your Drinks (Right) side of the page
            VStack{
                Text("Your Drinks")
                    .frame(width:120, height:30)
                    .foregroundColor(Color.white)
                    .font(.custom("Helvetica Neue", size: 20))
                    .background(Color.black)
                    .border(Color.white)
                ScrollView (.vertical){
//                    ForEach(0 ..< 15) { number in
                    MyDrinkView()
//                        .border(Color.black)
//                    }
                }.border(Color.black)
                NavigationLink(
                    destination: addOrRemoveListDrink(),
                        label: {
                            Spacer()
                            Text("Add or Remove")
                                .font(.system(size: 24, weight: .medium, design: .default))
                                .frame(minWidth:0, maxWidth:.infinity)
                                .foregroundColor(Color("myCoffeeWhiteSnow"))
                                .background(Color.black)
                                .border(Color.white)
                            Spacer()
                        })
            }
            Spacer()
        }
    }
}

struct addOrRemoveFavDrink: View{
    var body:some View{
        VStack{
            
        }.background(Color("myCoffeeControlColor"))
    }
}
struct addOrRemoveListDrink: View{
    var body:some View{
        VStack{
            
        }.background(Color("myCoffeeControlColor"))
    }
}

struct MyDrinkView: View{
    
    @ObservedObject var drinks = listDrinks()
    
    //@StateObject var drinkList = [userDrinkInfo]
    
    
    
    var body: some View{
        
        ForEach(0 ..< 3){ num in
            NavigationLink(
                destination: DetailsView(),
                label: {
                    VStack (alignment: .leading){
                        Text("Name:\(self.drinks.drinkList[num].drinkName)")
                            .font(.custom("Helvetica Neue", size: 10))
                            .foregroundColor(.black)
                        Text("Temperature:\(self.drinks.drinkList[num].temp)")
                            .font(.custom("Helvetica Neue", size: 10))
                            .foregroundColor(.black)
                    }.frame(width:120, height: 80)
                    .padding(.leading, 0)
                    .scaledToFit()
                    .background(Color("myCoffeeTurquoise"))
                    .border(Color.black)
                    
            })
        }
        
    }
}
//struct DetailViewDrinkList: View{
//    @State var drink = userDrinkInfo()
//
//    var body: some View{
//
//        Section{
//            Text(drink.drinkName)
//            Text(drink.bean)
//            Text(drink.bean)
//            Text(drink.bean)
//            Text(drink.bean)
//
//        }.background(Color("myCoffeeTurquoise"))
//
//    }
//}

struct FavDrinkView: View{
    var body: some View{
        VStack (alignment: .leading){
            Text("Drink Name")
                .padding(0)
                .font(.custom("Helvetica Neue", size: 14))
            Text("is cold/hot")
                .font(.custom("Helvetica Neue", size: 14))
        }.frame(width:120, height: 80).padding(.leading, 0).scaledToFit()
    }
}

struct listOfCoffeeSection_Previews: PreviewProvider {
    @State static var drinks = listDrinks()
    
    static var previews: some View {
        listOfCoffeeSection().environmentObject(self.drinks)
        MyCoffeeTabView().environmentObject(self.drinks)
    }
}

