import SwiftUI

struct listOfCoffeeSection: View{
    
    @ObservedObject var drinks: listDrinks
    @EnvironmentObject var userProfile:Profile
    
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
                    MyFavDrinkView(drinks: drinks).environmentObject(userProfile)
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
                    listDrinkView(drinks: drinks).environmentObject(userProfile)
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

struct MyFavDrinkView: View{
    @EnvironmentObject var userProfile:Profile
    @ObservedObject var drinks:listDrinks
    var noValue = "No Value"
    
    var body: some View{
        
        ForEach(drinks.drinkList) { drink in
            if drink.isFavorite ?? false{
                NavigationLink(
                    destination: DetailsView(drink: drink).environmentObject(userProfile),
                    label: {
                        VStack (alignment: .leading){
                            Text("Name:\(drink.drinkName ?? "")")
                                .font(.custom("Helvetica Neue", size: 10))
                                .foregroundColor(.black)
                            Text("Temperature:\(drink.temperature ?? "")")
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
}

struct listDrinkView: View{
    @EnvironmentObject var userProfile:Profile
    @ObservedObject var drinks:listDrinks
    var body: some View{
        ForEach(drinks.drinkList) { drink in
                NavigationLink(
                    destination: DetailsView(drink: drink).environmentObject(userProfile),
                    label: {
                        VStack (alignment: .leading){
                            Text("Name:\(drink.drinkName ?? "")")
                                .font(.custom("Helvetica Neue", size: 10))
                                .foregroundColor(.black)
                            Text("Temperature:\(drink.temperature ?? "")")
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

struct listOfCoffeeSection_Previews: PreviewProvider {
    @State static var drinks = listDrinks()
    
    static var previews: some View {
        listOfCoffeeSection(drinks: drinks)
        MyCoffeeTabView()
    }
}

