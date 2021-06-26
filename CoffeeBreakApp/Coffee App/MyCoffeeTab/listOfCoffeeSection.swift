import SwiftUI

struct listOfCoffeeSection: View{
    
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
                    ForEach(0 ..< 5) { number in
                    MyDrinkView()
                        .border(Color.black)
                    }
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
            Image(systemName:"arrow.left.arrow.right")
                .resizable()
                .frame(width: 75.0, height: 75.0, alignment: .center)
            Spacer()
            VStack{
                Text("Your Drinks")
                    .frame(width:120)
                    .foregroundColor(Color.white)
                    .font(.custom("Helvetica Neue", size: 20))
                    .background(Color.black)
                    .border(Color.white)
                ScrollView (.vertical){
                    ForEach(0 ..< 15) { number in
                    MyDrinkView()
                        .border(Color.black)
                    }
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
        VStack{
            
        }.frame(height:150)
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
    //@State var drink = [drinks]
    
    var body: some View{
        NavigationLink(
            destination: DetailViewDrinkList(),
            label: {
                VStack (alignment: .leading){
                    Text("Drink Name")
                        .padding(0)
                        .font(.custom("Helvetica Neue", size: 14))
                        .foregroundColor(.black)
                    Text("is cold/hot")
                        .font(.custom("Helvetica Neue", size: 14))
                        .foregroundColor(.black)
                }.frame(width:120, height: 80)
                .padding(.leading, 0)
                .scaledToFit()
                .background(Color("myCoffeeTurquoise"))
        })
    }
}
struct DetailViewDrinkList: View{
    @State var drink = userDrinkInfo()

    var body: some View{
    
        Section{
            Text(drink.drinkName)
            Text(drink.bean)
            Text(drink.bean)
            Text(drink.bean)
            Text(drink.bean)

        }.background(Color("myCoffeeTurquoise"))
        
    }
}

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
    static var previews: some View {
        listOfCoffeeSection()
        MyCoffeeTabView()
    }
}

